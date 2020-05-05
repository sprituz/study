class Scons < Formula
  desc "Substitute for classic 'make' tool with autoconf/automake functionality"
  homepage "https://www.scons.org/"
  url "https://downloads.sourceforge.net/project/scons/scons/3.1.2/scons-3.1.2.tar.gz"
  sha256 "7801f3f62f654528e272df780be10c0e9337e897650b62ddcee9f39fde13f8fb"
  revision 1

  bottle do
    cellar :any_skip_relocation
    sha256 "d754617c360bfc6701d9b3e345ff08d28530adafb302227ec6fe8eea6760ca28" => :catalina
    sha256 "d754617c360bfc6701d9b3e345ff08d28530adafb302227ec6fe8eea6760ca28" => :mojave
    sha256 "d754617c360bfc6701d9b3e345ff08d28530adafb302227ec6fe8eea6760ca28" => :high_sierra
  end

  depends_on "python@3.8"

  def install
    Language::Python.rewrite_python_shebang(Formula["python@3.8"].opt_bin/"python3")

    man1.install gzip("scons-time.1", "scons.1", "sconsign.1")
    system Formula["python@3.8"].opt_bin/"python3", "setup.py", "install",
             "--prefix=#{prefix}",
             "--standalone-lib",
             # SCons gets handsy with sys.path---`scons-local` is one place it
             # will look when all is said and done.
             "--install-lib=#{libexec}/scons-local",
             "--install-scripts=#{bin}",
             "--install-data=#{libexec}",
             "--no-version-script", "--no-install-man"

    # Re-root scripts to libexec so they can import SCons and symlink back into
    # bin. Similar tactics are used in the duplicity formula.
    bin.children.each do |p|
      mv p, "#{libexec}/#{p.basename}.py"
      bin.install_symlink "#{libexec}/#{p.basename}.py" => p.basename
    end
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <stdio.h>
      int main()
      {
        printf("Homebrew");
        return 0;
      }
    EOS
    (testpath/"SConstruct").write "Program('test.c')"
    system bin/"scons"
    assert_equal "Homebrew", shell_output("#{testpath}/test")
  end
end
