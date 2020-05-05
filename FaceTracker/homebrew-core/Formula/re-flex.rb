class ReFlex < Formula
  desc "The regex-centric, fast and flexible scanner generator for C++"
  homepage "https://www.genivia.com/doc/reflex/html"
  url "https://github.com/Genivia/RE-flex/archive/v1.6.6.tar.gz"
  sha256 "be98ae3b270ebec4261f5bc78b5bbbe02ce6afee080c175c9a6bb8f01e28eaee"

  bottle do
    cellar :any_skip_relocation
    sha256 "b3aaeca6a4d5b42f3bd117a63f33000e7997ac2613eb3724b7452c060c05980e" => :catalina
    sha256 "e5159fd4b0064a475cec8065366482dbcc3335f899bf35446e71fb90cbed305e" => :mojave
    sha256 "fa43c6264ba478c09aeffd748e5e8242b1ac678d4470d3b12187f9d7ec9f1628" => :high_sierra
  end

  depends_on "boost"
  depends_on "pcre2"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"echo.l").write <<~'EOS'
      %{
      #include <stdio.h>
      %}
      %option noyywrap main
      %%
      .+  ECHO;
      %%
    EOS
    system "#{bin}/reflex", "--flex", "echo.l"
    assert_predicate testpath/"lex.yy.cpp", :exist?
  end
end
