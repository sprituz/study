class Flake8 < Formula
  include Language::Python::Virtualenv

  desc "Lint your Python code for style and logical errors"
  homepage "https://flake8.pycqa.org/"
  url "https://gitlab.com/pycqa/flake8/-/archive/3.7.9/flake8-3.7.9.tar.bz2"
  sha256 "2fd4dfaaeb507e1bb5a598f76e61eca50d27930e550c215f73ed2e5454681c1e"
  revision 1
  head "https://gitlab.com/PyCQA/flake8.git", :shallow => false

  bottle do
    cellar :any_skip_relocation
    sha256 "7019d2b1798ec572cc97bea5a612ea712703f05686e710cbb2169e301d7f7cda" => :catalina
    sha256 "785bc151d0678145b316f24a795b5b85619329dac18fcd15e66f499d4fc7701a" => :mojave
    sha256 "4fb13673168caf9e31b1ef955283b62b8c4e4a057bd9554f14fc12f2b09c3896" => :high_sierra
  end

  depends_on "python@3.8"

  resource "entrypoints" do
    url "https://files.pythonhosted.org/packages/b4/ef/063484f1f9ba3081e920ec9972c96664e2edb9fdc3d8669b0e3b8fc0ad7c/entrypoints-0.3.tar.gz"
    sha256 "c70dd71abe5a8c85e55e12c19bd91ccfeec11a6e99044204511f9ed547d48451"
  end

  resource "mccabe" do
    url "https://files.pythonhosted.org/packages/06/18/fa675aa501e11d6d6ca0ae73a101b2f3571a565e0f7d38e062eec18a91ee/mccabe-0.6.1.tar.gz"
    sha256 "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
  end

  resource "pycodestyle" do
    url "https://files.pythonhosted.org/packages/1c/d1/41294da5915f4cae7f4b388cea6c2cd0d6cd53039788635f6875dfe8c72f/pycodestyle-2.5.0.tar.gz"
    sha256 "e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0ca976c"
  end

  resource "pyflakes" do
    url "https://files.pythonhosted.org/packages/52/64/87303747635c2988fcaef18af54bfdec925b6ea3b80bcd28aaca5ba41c9e/pyflakes-2.1.1.tar.gz"
    sha256 "d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e5449f8a2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"test.py").write <<~EOS
      print("Hello World!")
    EOS

    system "#{bin}/flake8", "test.py"
  end
end
