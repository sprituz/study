require "language/node"

class Whistle < Formula
  desc "HTTP, HTTP2, HTTPS, Websocket debugging proxy"
  homepage "https://github.com/avwo/whistle"
  url "https://registry.npmjs.org/whistle/-/whistle-2.5.3.tgz"
  sha256 "6885585307bbebf47b22a11dfe079461350c673f7599271516e4b7e3dd0d0f4d"

  bottle do
    cellar :any_skip_relocation
    sha256 "0fa395d6796a996387403944a42a527702f9c054b684748ac60e4e8db89c034c" => :catalina
    sha256 "fe55d5b931e849160aff6871652d646a3272fde536e753580f7e4cc547547bbf" => :mojave
    sha256 "1637cfc6bcd12a09740d3691e0777c9b74654b88760701a7c34f69cce2aaefdb" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"package.json").write('{"name": "test"}')
    system bin/"whistle", "start"
    system bin/"whistle", "stop"
  end
end
