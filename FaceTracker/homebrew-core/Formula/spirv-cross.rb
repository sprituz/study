class SpirvCross < Formula
  desc "Performing reflection and disassembling SPIR-V"
  homepage "https://github.com/KhronosGroup/SPIRV-Cross"
  url "https://github.com/KhronosGroup/SPIRV-Cross/archive/2020-04-03.tar.gz"
  version "2020-04-03"
  sha256 "93f3a6dfad17c9ca0bf4d2d80809e90118e13b47502eb395baba8784025d7e97"

  bottle do
    cellar :any_skip_relocation
    sha256 "676dcd4ec56ff3b2c1fc4be5c850623e2b839eaf9f16a9c42d13d200e93ed733" => :catalina
    sha256 "c0d66272d9671b9c11f7e14e98ca79d3d35bc49b3f2177ab2240f2162005caef" => :mojave
    sha256 "5ac27e4db196d90bf2680a4ad1175a2a827e2714924c0ecae6de608338d36d3d" => :high_sierra
  end

  depends_on "cmake" => :build
  depends_on "glm" => :test
  depends_on "glslang" => :test

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
    # required for tests
    prefix.install "samples"
    (include/"spirv_cross").install Dir["include/spirv_cross/*"]
  end

  test do
    cp_r Dir[prefix/"samples/cpp/*"], testpath
    inreplace "Makefile", "-I../../include", "-I#{include}"
    inreplace "Makefile", "../../spirv-cross", "spirv-cross"

    system "make"
  end
end
