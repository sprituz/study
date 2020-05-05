class Convox < Formula
  desc "Command-line interface for the Convox PaaS"
  homepage "https://convox.com/"
  url "https://github.com/convox/convox/archive/3.0.15.tar.gz"
  sha256 "0c5a5d0f2a7f4a6787de0e601d6ac7e2a84cfce36851ff9c6e970428fa77f1fa"
  version_scheme 1

  bottle do
    cellar :any_skip_relocation
    sha256 "467637f3b65b2c95be39b123636d23fe9a0bcc14846ba4779c6591a796663b17" => :catalina
    sha256 "0fb2e56141b15ce76040be72919739a91835ae95eb43cbe7e55d875b013354be" => :mojave
    sha256 "107dd961e2fe86fc396b3eb5fe357329f6387a7b3b83b1fb180176e9cb303b58" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-mod=vendor", "-ldflags=-X main.version=#{version}",
            "-o", bin/"convox", "-v", "./cmd/convox"
    prefix.install_metafiles
  end

  test do
    assert_equal "Authenticating with localhost... ERROR: invalid login\n",
      shell_output("#{bin}/convox login -t invalid localhost 2>&1", 1)
  end
end
