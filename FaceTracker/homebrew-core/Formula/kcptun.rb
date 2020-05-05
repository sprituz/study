class Kcptun < Formula
  desc "Stable & Secure Tunnel based on KCP with N:M multiplexing and FEC"
  homepage "https://github.com/xtaci/kcptun"
  url "https://github.com/xtaci/kcptun/archive/v20200409.tar.gz"
  sha256 "312b8f438549225dfd1eac95444dd6a4c50610578ddcf7ff21e19c73a855d4bc"
  head "https://github.com/xtaci/kcptun.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "5267f9a75abdb00a6ada00b008818fc66ee3cad4b0659d36bff9e0e7712604ab" => :catalina
    sha256 "a83769bd3e3dfb00debbe53a9dd8610e7bd87d232a7925a5aaac54c9c3e0a325" => :mojave
    sha256 "8214eae17ccafb7662c51e7a4b1a812ca3720ed03d9ca94770e63763c84265d8" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.VERSION=#{version} -s -w",
      "-o", bin/"kcptun_client", "github.com/xtaci/kcptun/client"
    system "go", "build", "-ldflags", "-X main.VERSION=#{version} -s -w",
      "-o", bin/"kcptun_server", "github.com/xtaci/kcptun/server"

    etc.install "examples/local.json" => "kcptun_client.json"
  end

  plist_options :manual => "#{HOMEBREW_PREFIX}/opt/kcptun/bin/kcptun_client -c #{HOMEBREW_PREFIX}/etc/kcptun_client.json"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/kcptun_client</string>
            <string>-c</string>
            <string>#{etc}/kcptun_client.json</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <dict>
            <key>Crashed</key>
            <true/>
            <key>SuccessfulExit</key>
            <false/>
          </dict>
          <key>ProcessType</key>
          <string>Background</string>
          <key>StandardErrorPath</key>
          <string>#{var}/log/kcptun.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/kcptun.log</string>
        </dict>
      </plist>
    EOS
  end

  test do
    server = fork { exec bin/"kcptun_server", "-t", "1.1.1.1:80" }
    client = fork { exec bin/"kcptun_client", "-r", "127.0.0.1:29900", "-l", ":12948" }
    sleep 1
    begin
      assert_match "cloudflare", shell_output("curl -vI http://127.0.0.1:12948/")
    ensure
      Process.kill 9, server
      Process.wait server
      Process.kill 9, client
      Process.wait client
    end
  end
end
