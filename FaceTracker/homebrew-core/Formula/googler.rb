class Googler < Formula
  include Language::Python::Shebang

  desc "Google Search and News from the command-line"
  homepage "https://github.com/jarun/googler"
  url "https://github.com/jarun/googler/archive/v4.0.tar.gz"
  sha256 "f72593ca2a3dccd7301c0fed55effd223cc38f6c21910bffbbfba1360c985cd3"
  revision 1
  head "https://github.com/jarun/googler.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "97afca64e14fcf98c8067a37533bf3399d505ff6b6ccd37e5783751d5295a715" => :catalina
    sha256 "27dba74915ce0fe67163cb753a9d6922c9faabb32f5413db48dc2afce96fda50" => :mojave
    sha256 "97afca64e14fcf98c8067a37533bf3399d505ff6b6ccd37e5783751d5295a715" => :high_sierra
  end

  depends_on "python@3.8"

  def install
    rewrite_shebang detected_python_shebang, "googler"
    system "make", "disable-self-upgrade"
    system "make", "install", "PREFIX=#{prefix}"
    bash_completion.install "auto-completion/bash/googler-completion.bash"
    fish_completion.install "auto-completion/fish/googler.fish"
    zsh_completion.install "auto-completion/zsh/_googler"
  end

  test do
    ENV["PYTHONIOENCODING"] = "utf-8"
    assert_match "Homebrew", shell_output("#{bin}/googler --noprompt Homebrew")
  end
end
