class ProtocGenGo < Formula
  desc "Go support for Google's protocol buffers"
  homepage "https://github.com/golang/protobuf"
  url "https://github.com/golang/protobuf/archive/v1.4.0.tar.gz"
  sha256 "629781fd71f7d4c58db37eff79dc09302054156193ef75f918d03408a617d40c"
  head "https://github.com/golang/protobuf.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "e02aa55676382d48d78c3e744cf483fe6da39cc9825aa460d93ba5171ebe66e3" => :catalina
    sha256 "e02aa55676382d48d78c3e744cf483fe6da39cc9825aa460d93ba5171ebe66e3" => :mojave
    sha256 "e02aa55676382d48d78c3e744cf483fe6da39cc9825aa460d93ba5171ebe66e3" => :high_sierra
  end

  depends_on "go" => :build
  depends_on "protobuf"

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w", "./protoc-gen-go"
    prefix.install_metafiles
  end

  test do
    protofile = testpath/"proto3.proto"
    protofile.write <<~EOS
      syntax = "proto3";
      package proto3;
      message Request {
        string name = 1;
        repeated int64 key = 2;
      }
    EOS
    system "protoc", "--go_out=.", "proto3.proto"
    assert_predicate testpath/"proto3.pb.go", :exist?
    refute_predicate (testpath/"proto3.pb.go").size, :zero?
  end
end
