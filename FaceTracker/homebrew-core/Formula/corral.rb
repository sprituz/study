class Corral < Formula
  desc "Dependency manager for the Pony language"
  homepage "https://github.com/ponylang/corral"
  url "https://github.com/ponylang/corral/archive/0.3.1.tar.gz"
  sha256 "ab6fc435db5726a3ea68c8364f3de665551825e5dd58c06ce19576ef7266e602"
  head "https://github.com/ponylang/corral.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "ff0c52c47e69009b9134b359b4f1991463c3f7e7165f13168af07ccfb043b5d8" => :catalina
    sha256 "ff0c52c47e69009b9134b359b4f1991463c3f7e7165f13168af07ccfb043b5d8" => :mojave
    sha256 "9e0df540a3bf641d7abcd1035d78c21c8da77e1584011c5f0fbee9664ce07d3c" => :high_sierra
  end

  depends_on "ponyc"

  def install
    system "make", "prefix=#{prefix}", "install"
  end

  test do
    (testpath/"test/main.pony").write <<~EOS
      actor Main
        new create(env: Env) =>
          env.out.print("Hello World!")
    EOS
    system "#{bin}/corral", "run", "--", "ponyc", "test"
    assert_equal "Hello World!", shell_output("./test1").chomp
  end
end
