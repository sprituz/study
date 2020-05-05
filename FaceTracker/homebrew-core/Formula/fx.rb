require "language/node"

class Fx < Formula
  desc "Command-line JSON processing tool"
  homepage "https://github.com/antonmedv/fx"
  url "https://registry.npmjs.org/fx/-/fx-18.0.1.tgz"
  sha256 "d7cba3cf63743600c2a246b3f32178432fe1a2ba5a2ab77675c16eda342a3dd5"

  bottle do
    cellar :any_skip_relocation
    sha256 "6eeffd6a8a5c7375210fd900a15ffa92125358f4fa527042cc40bf06cb28737a" => :catalina
    sha256 "828fb186c9297842b9de006ebd9c32be30c43a134fc2478fac03e2d0dbda0252" => :mojave
    sha256 "467c10fb9f1fb6caf54511e50dba80d24a83ea7d01cafbc87e293376e5d23e02" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "bar", shell_output("echo '{\"foo\": \"bar\"}' #{bin}/fx .foo")
  end
end
