class Quickjs < Formula
  desc "Small and embeddable JavaScript engine"
  homepage "https://bellard.org/quickjs/"
  url "https://bellard.org/quickjs/quickjs-2020-01-19.tar.xz"
  sha256 "4ae4c20c4ed7c201d72c228d5e8768314950914ba60d759f3df23d59037f2b85"

  bottle do
    sha256 "6b58b873d191cd9fa62edee7dddc1895770b4c0bfcd8d0c1cc12bb3dcfe92060" => :catalina
    sha256 "769005f2941b87413e9bd74ec02a8fbb261e0d7e84b9ce1727165fa16c95643a" => :mojave
    sha256 "a7744927e0027cb9ff79f4f0d4b510ecb0d78ce84865ccec4f9e2e96b7ce17b0" => :high_sierra
  end

  def install
    system "make", "install", "prefix=#{prefix}", "CONFIG_M32="
  end

  test do
    output = shell_output("#{bin}/qjs --eval 'const js=\"JS\"; console.log(`Q${js}${(7 + 35)}`);'").strip
    assert_match /^QJS42/, output

    path = testpath/"test.js"
    path.write "console.log('hello');"
    system "#{bin}/qjsc", path
    output = shell_output(testpath/"a.out").strip
    assert_equal "hello", output
  end
end
