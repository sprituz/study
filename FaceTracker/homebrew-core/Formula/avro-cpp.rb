class AvroCpp < Formula
  desc "Data serialization system"
  homepage "https://avro.apache.org/"
  url "https://www.apache.org/dyn/closer.lua?path=avro/avro-1.9.2/cpp/avro-cpp-1.9.2.tar.gz"
  mirror "https://archive.apache.org/dist/avro/avro-1.9.2/cpp/avro-cpp-1.9.2.tar.gz"
  sha256 "bd50f380ed4f77231721ee2347dd0ca3991f6fec5254acdf7e5f105253deba6b"

  bottle do
    cellar :any
    sha256 "9baadced334c366c8380270089efb97b37ff4ea89e7b321f499679ba3c599da3" => :catalina
    sha256 "5fd2a6b0a912f60d6943815e6e2abae2273d3ad53e33bf7634eabb5f71e3a322" => :mojave
    sha256 "e714f29fae402fe8c7ce50cb02c984f6222b600ed4ea360d6e7b1880f7feb45b" => :high_sierra
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    (testpath/"cpx.json").write <<~EOS
      {
          "type": "record",
          "name": "cpx",
          "fields" : [
              {"name": "re", "type": "double"},
              {"name": "im", "type" : "double"}
          ]
      }
    EOS
    (testpath/"test.cpp").write <<~EOS
      #include "cpx.hh"

      int main() {
        cpx::cpx number;
        return 0;
      }
    EOS
    system "#{bin}/avrogencpp", "-i", "cpx.json", "-o", "cpx.hh", "-n", "cpx"
    system ENV.cxx, "test.cpp", "-o", "test"
    system "./test"
  end
end
