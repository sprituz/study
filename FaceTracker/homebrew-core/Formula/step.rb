class Step < Formula
  desc "Crypto and x509 Swiss-Army-Knife"
  homepage "https://smallstep.com"
  url "https://github.com/smallstep/cli/releases/download/v0.14.2/step-cli_0.14.2.tar.gz"
  sha256 "5653a655d6b88acf126bd6eae3a2d1dce1f2d770b95afb17777a7e98ae40a075"

  bottle do
    cellar :any_skip_relocation
    sha256 "b497e226b85a288584d436a46c0f7f184a177c8cdf899bc7f7f22747b034b0c1" => :catalina
    sha256 "6a5e4b8c67864b2d594c0e33501c81fe29ffb4244c30803e8a8d23c2e41dd703" => :mojave
    sha256 "a5f1101c053f25e571d1c20eb100c196e515c42ea6c6184da02282405de2059d" => :high_sierra
  end

  depends_on "dep" => :build
  depends_on "go" => :build

  resource "certificates" do
    url "https://github.com/smallstep/certificates/releases/download/v0.14.2/step-certificates_0.14.2.tar.gz"
    sha256 "86d28a3bf9e282ef8f6ea99516671f6822f29657bb96db8b0ffce46a805bce5a"
  end

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/smallstep/cli").install buildpath.children
    cd "src/github.com/smallstep/cli" do
      system "make", "build"
      bin.install "bin/step" => "step"
      bash_completion.install "autocomplete/bash_autocomplete" => "step"
      zsh_completion.install "autocomplete/zsh_autocomplete" => "_step"
    end

    resource("certificates").stage "#{buildpath}/src/github.com/smallstep/certificates"
    cd "#{buildpath}/src/github.com/smallstep/certificates" do
      system "make", "build"
      bin.install "bin/step-ca" => "step-ca"
    end
  end

  test do
    # Generate a public / private key pair. Creates foo.pub and foo.priv.
    system "#{bin}/step", "crypto", "keypair", "foo.pub", "foo.priv", "--no-password", "--insecure"
    assert_predicate testpath/"foo.pub", :exist?
    assert_predicate testpath/"foo.priv", :exist?

    # Generate a root certificate and private key with subject baz written to baz.crt and baz.key.
    system "#{bin}/step", "certificate", "create", "--profile", "root-ca",
        "--no-password", "--insecure", "baz", "baz.crt", "baz.key"
    assert_predicate testpath/"baz.crt", :exist?
    assert_predicate testpath/"baz.key", :exist?
    baz_crt = File.read(testpath/"baz.crt")
    assert_match(/^-----BEGIN CERTIFICATE-----.*/, baz_crt)
    assert_match(/.*-----END CERTIFICATE-----$/, baz_crt)
    baz_key = File.read(testpath/"baz.key")
    assert_match(/^-----BEGIN EC PRIVATE KEY-----.*/, baz_key)
    assert_match(/.*-----END EC PRIVATE KEY-----$/, baz_key)
    shell_output("#{bin}/step certificate inspect --format json baz.crt > baz_crt.json")
    baz_crt_json = JSON.parse(File.read(testpath/"baz_crt.json"))
    assert_equal "CN=baz", baz_crt_json["subject_dn"]
    assert_equal "CN=baz", baz_crt_json["issuer_dn"]

    # Generate a leaf certificate signed by the previously created root.
    system "#{bin}/step", "certificate", "create", "--profile", "intermediate-ca",
        "--no-password", "--insecure", "--ca", "baz.crt", "--ca-key", "baz.key",
        "zap", "zap.crt", "zap.key"
    assert_predicate testpath/"zap.crt", :exist?
    assert_predicate testpath/"zap.key", :exist?
    zap_crt = File.read(testpath/"zap.crt")
    assert_match(/^-----BEGIN CERTIFICATE-----.*/, zap_crt)
    assert_match(/.*-----END CERTIFICATE-----$/, zap_crt)
    zap_key = File.read(testpath/"zap.key")
    assert_match(/^-----BEGIN EC PRIVATE KEY-----.*/, zap_key)
    assert_match(/.*-----END EC PRIVATE KEY-----$/, zap_key)
    shell_output("#{bin}/step certificate inspect --format json zap.crt > zap_crt.json")
    zap_crt_json = JSON.parse(File.read(testpath/"zap_crt.json"))
    assert_equal "CN=zap", zap_crt_json["subject_dn"]
    assert_equal "CN=baz", zap_crt_json["issuer_dn"]

    # Initialize a PKI and step-ca configuration, boot the CA, and create a
    # certificate using the API.
    (testpath/"password.txt").write("password")
    steppath = "#{testpath}/.step"
    Dir.mkdir(steppath) unless File.exist?(steppath)
    ENV["STEPPATH"] = steppath
    system "#{bin}/step", "ca", "init", "--address", "127.0.0.1:8081",
        "--dns", "127.0.0.1", "--password-file", "#{testpath}/password.txt",
        "--provisioner-password-file", "#{testpath}/password.txt", "--name",
        "homebrew-smallstep-test", "--provisioner", "brew"

    begin
      pid = fork do
        exec "#{bin}/step-ca", "--password-file", "#{testpath}/password.txt",
          "#{steppath}/config/ca.json"
      end

      sleep 2
      shell_output("#{bin}/step ca health > health_response.txt")
      assert_match(/^ok$/, File.read(testpath/"health_response.txt"))

      shell_output("#{bin}/step ca token --password-file #{testpath}/password.txt " \
"homebrew-smallstep-leaf > token.txt")
      token = File.read(testpath/"token.txt")
      system "#{bin}/step", "ca", "certificate", "--token", token,
          "homebrew-smallstep-leaf", "brew.crt", "brew.key"

      assert_predicate testpath/"brew.crt", :exist?
      assert_predicate testpath/"brew.key", :exist?
      brew_crt = File.read(testpath/"brew.crt")
      assert_match(/^-----BEGIN CERTIFICATE-----.*/, brew_crt)
      assert_match(/.*-----END CERTIFICATE-----$/, brew_crt)
      brew_key = File.read(testpath/"brew.key")
      assert_match(/^-----BEGIN EC PRIVATE KEY-----.*/, brew_key)
      assert_match(/.*-----END EC PRIVATE KEY-----$/, brew_key)
      shell_output("#{bin}/step certificate inspect --format json brew.crt > brew_crt.json")
      brew_crt_json = JSON.parse(File.read(testpath/"brew_crt.json"))
      assert_equal "CN=homebrew-smallstep-leaf", brew_crt_json["subject_dn"]
      assert_equal "CN=homebrew-smallstep-test Intermediate CA", brew_crt_json["issuer_dn"]
    ensure
      Process.kill(9, pid)
      Process.wait(pid)
    end
  end
end
