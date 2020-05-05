class Inspircd < Formula
  desc "Modular C++ Internet Relay Chat daemon"
  homepage "https://www.inspircd.org/"
  url "https://github.com/inspircd/inspircd/archive/v3.6.0.tar.gz"
  sha256 "f9a80ddfd8354163e0935ec65ea2c596c93152560ebb56dbeb5f8b3e1b53eb1e"

  bottle do
    sha256 "5ffffc7ee1d4a804d3bea62c0daacbc37113504cd540b107c7845c001613ea91" => :catalina
    sha256 "72807c0b16c0a71fc272a67dc0ab0678f8978443e37d2492bf758263d1a29526" => :mojave
    sha256 "10773bb68411503c25a83bf09b6ba3bbdb7ba0f40ff10bc5afe4b07c9b0e81e3" => :high_sierra
  end

  depends_on "pkg-config" => :build

  skip_clean "data"
  skip_clean "logs"

  def install
    system "./configure", "--enable-extras=m_ldapauth.cpp,m_ldapoper.cpp"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match("ERROR: Cannot open config file", shell_output("#{bin}/inspircd", 2))
  end
end
