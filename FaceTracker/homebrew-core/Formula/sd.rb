class Sd < Formula
  desc "Intuitive find & replace CLI"
  homepage "https://github.com/chmln/sd"
  url "https://github.com/chmln/sd/archive/v0.7.4.tar.gz"
  sha256 "94064871151b472b72ed8ace353182a9d0cbba7a961921a37a27d382eb613426"

  bottle do
    cellar :any_skip_relocation
    sha256 "5bde1490283fa9844eb9af5ac0d8f2f3d744923c39a5b7c9bfd959b186a7571a" => :catalina
    sha256 "8525800846c415c336621b5d9d284b01ab0d42603c4f9922d0c332d4d4bc0573" => :mojave
    sha256 "e02cebee44a63afba05378546b86c58be59252dbd6acb99dd4a34aabeb19d861" => :high_sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_equal "after", pipe_output("#{bin}/sd before after", "before")
  end
end
