class AwsSdkCpp < Formula
  desc "AWS SDK for C++"
  homepage "https://github.com/aws/aws-sdk-cpp"
  # aws-sdk-cpp should only be updated every 10 releases on multiples of 10
  url "https://github.com/aws/aws-sdk-cpp/archive/1.7.320.tar.gz"
  sha256 "49b61175bb532e494fdc90bdc8f2564027a1d62b31cbbb988e793cdc2de39507"
  head "https://github.com/aws/aws-sdk-cpp.git"

  bottle do
    sha256 "a8b3aea666ac8eadd8e7382cf769c97c92fce4ea4417a60fb3ddfa31d60609a0" => :catalina
    sha256 "c8d04ab9bda0da5a60a38fefae1cf7184a4d413b598208674a3e6eea77497311" => :mojave
    sha256 "49a1ad8cd5422fcaec67ba28453a9463b8bf66798bb921e33c0663b773c35c12" => :high_sierra
  end

  depends_on "cmake" => :build

  uses_from_macos "curl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end

    lib.install Dir[lib/"mac/Release/*"].select { |f| File.file? f }
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <aws/core/Version.h>
      #include <iostream>

      int main() {
          std::cout << Aws::Version::GetVersionString() << std::endl;
          return 0;
      }
    EOS
    system ENV.cxx, "-std=c++11", "test.cpp", "-L#{lib}", "-laws-cpp-sdk-core",
           "-o", "test"
    system "./test"
  end
end
