class Cython < Formula
  desc "Compiler for writing C extensions for the Python language"
  homepage "https://cython.org/"
  url "https://files.pythonhosted.org/packages/49/8a/6a4135469372da2e3d9f88f71c6d00d8a07ef65f121eeca0c7ae21697219/Cython-0.29.16.tar.gz"
  sha256 "232755284f942cbb3b43a06cd85974ef3c970a021aef19b5243c03ee2b08fa05"
  revision 1

  bottle do
    cellar :any_skip_relocation
    sha256 "45ffaa3c28339449a44d1a98eb0c1b93833426e0f9f6b3b2ab43fa731bd83d97" => :catalina
    sha256 "42db9bb7e9caf0c996dcc22a28057df648f856df6b2a7e19a859b79b39707864" => :mojave
    sha256 "0b606ebb137117abad8e735eb404a8ff751f51c43a4bc592bf0bcea0ab5f59c2" => :high_sierra
  end

  keg_only <<~EOS
    this formula is mainly used internally by other formulae.
    Users are advised to use `pip` to install cython
  EOS

  depends_on "python@3.8"

  def install
    xy = Language::Python.major_minor_version Formula["python@3.8"].opt_bin/"python3"
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
    system Formula["python@3.8"].opt_bin/"python3", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    xy = Language::Python.major_minor_version Formula["python@3.8"].opt_bin/"python3"
    ENV.prepend_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"

    phrase = "You are using Homebrew"
    (testpath/"package_manager.pyx").write "print '#{phrase}'"
    (testpath/"setup.py").write <<~EOS
      from distutils.core import setup
      from Cython.Build import cythonize

      setup(
        ext_modules = cythonize("package_manager.pyx")
      )
    EOS
    system Formula["python@3.8"].opt_bin/"python3", "setup.py", "build_ext", "--inplace"
    assert_match phrase, shell_output("#{Formula["python@3.8"].opt_bin}/python3 -c 'import package_manager'")
  end
end
