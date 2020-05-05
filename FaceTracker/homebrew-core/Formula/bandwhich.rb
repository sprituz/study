class Bandwhich < Formula
  desc "Terminal bandwidth utilization tool"
  homepage "https://github.com/imsnif/bandwhich"
  url "https://github.com/imsnif/bandwhich/archive/0.13.0.tar.gz"
  sha256 "42b0411c0a9df0b51fa5bedaa5f04fb001fdf46cd2d7ea9a58c98f4f6e7a15d3"

  bottle do
    cellar :any_skip_relocation
    sha256 "d300f3ad9765899e54e43d7635ac36ffc7b1ea239bd4e2f5a9218beca62f2e4f" => :catalina
    sha256 "c9b2e642a3a16178d413803b0f01f471c7e30f2a0b26962b4d27f68d5c9450fd" => :mojave
    sha256 "d4649250792a1e03a7eee91eb8303c2f18bfcccc3269e5e050603e375576b6ea" => :high_sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    output = shell_output "#{bin}/bandwhich --interface bandwhich", 2
    assert_match output, "Error: Cannot find interface bandwhich"
  end
end
