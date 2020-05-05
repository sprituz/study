class Fetchmail < Formula
  desc "Fetch mail from a POP, IMAP, ETRN, or ODMR-capable server"
  homepage "https://www.fetchmail.info/"
  url "https://downloads.sourceforge.net/project/fetchmail/branch_6.4/fetchmail-6.4.4.tar.xz"
  sha256 "511b60daabf7543a01de06af07c8772290c6807cd53c42a8504960e978f3abea"

  bottle do
    cellar :any
    sha256 "66608f324aab592b2d5ab414ae20b9ddb8266663bf1a4cdc7419b66136826146" => :catalina
    sha256 "ecbf246a70f5c7d5939beb5f21bf2cffa9fdb339f93fb763bb26c20486cbb9df" => :mojave
    sha256 "f6fafd9d2dfef18062f9168edcd3d32f3e97ef04558fe8936f93ce7afaa664e4" => :high_sierra
  end

  depends_on "openssl@1.1"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-ssl=#{Formula["openssl@1.1"].opt_prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/fetchmail", "--version"
  end
end
