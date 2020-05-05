class MpsYoutube < Formula
  include Language::Python::Virtualenv

  desc "Terminal based YouTube player and downloader"
  homepage "https://github.com/mps-youtube/mps-youtube"
  url "https://github.com/mps-youtube/mps-youtube/archive/v0.2.8.tar.gz"
  sha256 "d5f2c4bc1f57f0566242c4a0a721a5ceaa6d6d407f9d6dd29009a714a0abec74"
  revision 9

  bottle do
    cellar :any_skip_relocation
    sha256 "4bd9882d37990b6248a1c66e2a5a811ec56623137bce402349f6d3f0b26b266e" => :catalina
    sha256 "010336617d49531753133de6b438ff69d3e34d49b72caaa356e9c7e5260db814" => :mojave
    sha256 "bbb8c699b6bab92ac2cef47608a8d5dc5bd110a04e842d5720620b0c9793c060" => :high_sierra
  end

  depends_on "mplayer"
  depends_on "python"

  resource "pafy" do
    url "https://files.pythonhosted.org/packages/7e/02/b70f4d2ad64bbc7d2a00018c6545d9b9039208553358534e73e6dd5bbaf6/pafy-0.5.5.tar.gz"
    sha256 "364f1d1312c89582d97dc7225cf6858cde27cb11dfd64a9c2bab1a2f32133b1e"
  end

  resource "youtube_dl" do
    url "https://files.pythonhosted.org/packages/1e/c7/8f0b6cb38fd9c44adb7c612c2f83bb0a53f04a82a29165f19c320ff4c243/youtube_dl-2020.1.24.tar.gz"
    sha256 "82189f971fbe3f4b2e66a9aba7fb5bdd1b4b8c0876d7cd55382045f5555a5e44"
  end

  def install
    venv = virtualenv_create(libexec, "python3")

    %w[youtube_dl pafy].each do |r|
      venv.pip_install resource(r)
    end

    venv.pip_install_and_link buildpath
  end

  def caveats
    <<~EOS
      Install the optional mpv app with Homebrew Cask:
        brew cask install mpv
    EOS
  end

  test do
    Open3.popen3("#{bin}/mpsyt", "/Drop4Drop x Ed Sheeran,", "da 1,", "q") do |_, _, stderr|
      assert_empty stderr.read, "Some warnings were raised"
    end
  end
end
