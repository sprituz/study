class Nift < Formula
  desc "Cross-platform open source framework for managing and generating websites"
  homepage "https://nift.cc/"
  url "https://github.com/nifty-site-manager/nsm/archive/v2.3.6.tar.gz"
  sha256 "0176eaa37ed9f92fbf09ed4fc0f73dc9a560c3cddba83e70586ff096356e9466"

  bottle do
    cellar :any_skip_relocation
    sha256 "d919ff19a5bfe721ed89d30ec1bf1521e834e94b3bc98de5bce944187333cc12" => :catalina
    sha256 "c040d4df6645c31259c50d704a3e1e61952abf347d5d60e288ccd83e09eb73ba" => :mojave
    sha256 "d8981f2b67e1693dc3dc957fe33d21e95881a52be8fab292ab5f079796f86391" => :high_sierra
  end

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    mkdir "empty" do
      system "#{bin}/nsm", "init", ".html"
      assert_predicate testpath/"empty/output/index.html", :exist?
    end
  end
end
