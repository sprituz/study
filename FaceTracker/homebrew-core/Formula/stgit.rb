class Stgit < Formula
  desc "Push/pop utility built on top of Git"
  homepage "https://github.com/ctmarinas/stgit"
  url "https://github.com/ctmarinas/stgit/releases/download/v0.22/stgit-0.22.tar.gz"
  sha256 "394438e7f7de9fac2532632bd3e202137f9f8b6b91ad3667e467766571551bd0"
  head "https://github.com/ctmarinas/stgit.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "1a965a4f7b50412601a6517d5b7ea2faf62ab2ac1cb0dc5049b42dc595d517d4" => :catalina
    sha256 "1a965a4f7b50412601a6517d5b7ea2faf62ab2ac1cb0dc5049b42dc595d517d4" => :mojave
    sha256 "1a965a4f7b50412601a6517d5b7ea2faf62ab2ac1cb0dc5049b42dc595d517d4" => :high_sierra
  end

  depends_on "asciidoc" => :build
  depends_on "xmlto" => :build
  depends_on "python@3.8"

  def install
    ENV["PYTHON"] = Formula["python@3.8"].opt_bin/"python3"
    ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
    system "make", "prefix=#{prefix}", "all"
    system "make", "prefix=#{prefix}", "install"
    system "make", "prefix=#{prefix}", "install-doc"
    bash_completion.install "completion/stgit.bash"
    fish_completion.install "completion/stg.fish"
    zsh_completion.install "completion/stgit.zsh" => "_stgit"
  end

  test do
    system "git", "init"
    system "git", "config", "user.name", "BrewTestBot"
    system "git", "config", "user.email", "brew@test.bot"
    (testpath/"test").write "test"
    system "git", "add", "test"
    system "git", "commit", "--message", "Initial commit", "test"
    system "#{bin}/stg", "--version"
    system "#{bin}/stg", "init"
    system "#{bin}/stg", "new", "-m", "patch0"
    (testpath/"test").append_lines "a change"
    system "#{bin}/stg", "refresh"
    system "#{bin}/stg", "log"
  end
end
