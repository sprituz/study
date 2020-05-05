class Hyperfine < Formula
  desc "Command-line benchmarking tool"
  homepage "https://github.com/sharkdp/hyperfine"
  url "https://github.com/sharkdp/hyperfine/archive/v1.9.0.tar.gz"
  sha256 "c2b1c6b6364b849acad43dc740c693f5b75a1a4649f24f43967a98c59ad9e9f7"

  bottle do
    cellar :any_skip_relocation
    sha256 "94a701d1f755932a8b5e7e6f960eb2241ad3431ebf654454be5f2f498d74a5e3" => :catalina
    sha256 "737d4064337cec2f91770e01af9362768c56ee0e4bd95fc9a247ffac0c4aa60d" => :mojave
    sha256 "a1e66402390ccacf306c123016cb94e405f0b1a13a7dd61a6dd879ca5391ddfe" => :high_sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    output = shell_output("#{bin}/hyperfine 'sleep 0.3'")
    assert_match "Benchmark #1: sleep", output
  end
end
