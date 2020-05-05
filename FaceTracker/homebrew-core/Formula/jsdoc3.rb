require "language/node"

class Jsdoc3 < Formula
  desc "API documentation generator for JavaScript"
  homepage "https://jsdoc.app/"
  url "https://registry.npmjs.org/jsdoc/-/jsdoc-3.6.4.tgz"
  sha256 "c2300f92bff732407c2dfd6241002f9dc221c311ec24d205e6bb6b95c826ec02"
  head "https://github.com/jsdoc3/jsdoc.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "8f873274000b4e3d0959b91bfc67e7019861171d980194e65bdeec2295f6699c" => :catalina
    sha256 "55423238074c5cef313aee63947353a5f785af4fba129ab26c21d49654c81b43" => :mojave
    sha256 "babfa75687211cb6aa6e7d9466bed814eb43b25ef0f5c6ada5352e5179a7eae2" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.js").write <<~EOS
      /**
       * Represents a formula.
       * @constructor
       * @param {string} name - the name of the formula.
       * @param {string} version - the version of the formula.
       **/
      function Formula(name, version) {}
    EOS

    system bin/"jsdoc", "--verbose", "test.js"
  end
end
