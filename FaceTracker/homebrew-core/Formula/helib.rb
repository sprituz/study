class Helib < Formula
  desc "Implementation of homomorphic encryption"
  homepage "https://github.com/homenc/HElib"
  url "https://github.com/homenc/HElib/archive/v1.0.0.tar.gz"
  sha256 "5b917a6ba1555be580db4c102a339abe124c284007f0044d637892ec85877214"

  bottle do
    cellar :any
    sha256 "ad8926ac577b4adb2ce1cce23769e3a3d31027ed7264c99aa42099e238525fe4" => :catalina
    sha256 "3ffb80af12a8fd92b03292a375a3ca30c24ae61281b1dd81e5022fe363e39b8f" => :mojave
    sha256 "c0fed1980b3e977ab565b6bea93d885c3a697881d20ecd812640f3d0a869b6d2" => :high_sierra
  end

  depends_on "cmake" => :build
  depends_on "ntl"

  def install
    mkdir "build" do
      system "cmake", "-DBUILD_SHARED=ON", "..", *std_cmake_args
      system "make", "install"
    end
    pkgshare.install "examples"
  end

  test do
    cp (pkgshare/"examples/BGV_general_example/BGV_general_example.cpp"), testpath/"test.cpp"
    system ENV.cxx, "-std=c++14", "-L#{lib}", "-L#{Formula["ntl"].opt_lib}",
                    "-lhelib", "-lntl", "test.cpp", "-o", "test"
    # 2*(n^2) from 0 to 23
    expected = "0 2 8 18 32 50 72 98 128 162 200 242 288 338 392 450 512 578 648 722 800 882 968 1058"
    assert_match expected, shell_output("./test")
  end
end
