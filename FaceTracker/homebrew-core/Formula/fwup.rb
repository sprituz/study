class Fwup < Formula
  desc "Configurable embedded Linux firmware update creator and runner"
  homepage "https://github.com/fhunleth/fwup"
  url "https://github.com/fhunleth/fwup/releases/download/v1.6.0/fwup-1.6.0.tar.gz"
  sha256 "4ef4b316fd9f2368ec7d0a18da0aa08091b920d57c67d853d0227a367153fecf"

  bottle do
    cellar :any
    sha256 "df1cdfee99a78add9702ea6282d2760fe83c98a13c8f58ec8b5c3c1278ec5c86" => :catalina
    sha256 "6cbe0b848a1dd4e235a3b3fa216b7922d88d59c96e5a9b63a307bd005a8276c3" => :mojave
    sha256 "847242889c6f6940f6ea6e769f50a2c0142b55945edeab2e64bc695306d9a73f" => :high_sierra
  end

  depends_on "pkg-config" => :build
  depends_on "confuse"
  depends_on "libarchive"

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make", "install"
  end

  test do
    system bin/"fwup", "-g"
    assert_predicate testpath/"fwup-key.priv", :exist?, "Failed to create fwup-key.priv!"
    assert_predicate testpath/"fwup-key.pub", :exist?, "Failed to create fwup-key.pub!"
  end
end
