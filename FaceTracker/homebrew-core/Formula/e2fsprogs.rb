class E2fsprogs < Formula
  desc "Utilities for the ext2, ext3, and ext4 file systems"
  homepage "https://e2fsprogs.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.45.5/e2fsprogs-1.45.5.tar.gz"
  sha256 "91e72a2f6fee21b89624d8ece5a4b3751a17b28775d32cd048921050b4760ed9"
  head "https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git"

  bottle do
    sha256 "6cdc9af84e3ddcb65e4992bc3aa9b6da7a3a18fae82371ee0d2fd93334b1e6b9" => :catalina
    sha256 "915bb98703fa35bfe6ac6c3a5799c8c482d71a9b318858e6ac0c37370fcada55" => :mojave
    sha256 "1f365047c69fc772a23c37712b49062b016181c0c32dbc47a9c930f3fbf611dd" => :high_sierra
  end

  keg_only "this installs several executables which shadow macOS system commands"

  depends_on "pkg-config" => :build
  depends_on "gettext"

  def install
    # Enforce MKDIR_P to work around a configure bug
    # see https://github.com/Homebrew/homebrew-core/pull/35339
    # and https://sourceforge.net/p/e2fsprogs/discussion/7053/thread/edec6de279/
    system "./configure", "--prefix=#{prefix}", "--disable-e2initrd-helper",
                          "MKDIR_P=mkdir -p"

    system "make"
    system "make", "install"
    system "make", "install-libs"
  end

  test do
    assert_equal 36, shell_output("#{bin}/uuidgen").strip.length
    system bin/"lsattr", "-al"
  end
end
