class PythonMarkdown < Formula
  desc "Python implementation of Markdown"
  homepage "https://pypi.python.org/pypi/Markdown"
  url "https://files.pythonhosted.org/packages/98/79/ce6984767cb9478e6818bd0994283db55c423d733cc62a88a3ffb8581e11/Markdown-3.2.1.tar.gz"
  sha256 "90fee683eeabe1a92e149f7ba74e5ccdc81cd397bd6c516d93a8da0ef90b6902"

  bottle do
    cellar :any_skip_relocation
    sha256 "75cc5fbd54e5fafb75e618868a18d1f2276614b4ac2c842217f633bb0529ab4f" => :catalina
    sha256 "75cc5fbd54e5fafb75e618868a18d1f2276614b4ac2c842217f633bb0529ab4f" => :mojave
    sha256 "75cc5fbd54e5fafb75e618868a18d1f2276614b4ac2c842217f633bb0529ab4f" => :high_sierra
  end

  depends_on "python"

  def install
    xy = Language::Python.major_minor_version "python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
    system "python3", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    (testpath/"test.md").write("# Hello World!")
    assert_equal "<h1>Hello World!</h1>", shell_output(bin/"markdown_py test.md").strip
  end
end
