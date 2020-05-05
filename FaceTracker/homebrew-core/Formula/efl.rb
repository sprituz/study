class Efl < Formula
  desc "Enlightenment Foundation Libraries"
  homepage "https://www.enlightenment.org"
  url "https://download.enlightenment.org/rel/libs/efl/efl-1.23.3.tar.xz"
  sha256 "53cea69eaabe443a099fb204b7353e968e7bb62b41fbb0da24451403c7a56901"
  revision 1

  bottle do
    sha256 "457fb34df5c78927bd93080ecc39a823d6a227b5d650324658751de482b6e460" => :catalina
    sha256 "fcb4cb15113062b4b7c36e8b14d1574d367393d4793ea4704ae2e24cf593ae2c" => :mojave
    sha256 "d0d2577a41f2799591a861ec4f5c53db2745c5553d12d34adb85b1776ea710e4" => :high_sierra
  end

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "bullet"
  depends_on "dbus"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "fribidi"
  depends_on "gettext"
  depends_on "giflib"
  depends_on "glib"
  depends_on "gst-plugins-good"
  depends_on "gstreamer"
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "libraw"
  depends_on "librsvg"
  depends_on "libsndfile"
  depends_on "libspectre"
  depends_on "libtiff"
  depends_on "luajit"
  depends_on "lz4"
  depends_on "openssl@1.1"
  depends_on "poppler"
  depends_on "pulseaudio"
  depends_on "shared-mime-info"

  uses_from_macos "zlib"

  # Fix build with 10.15+ SDK
  patch do
    url "https://github.com/Enlightenment/efl/commit/51e4bcc32c8b3d20980dd4f669e92e32a95a82fb.patch?full_index=1"
    sha256 "173f15e9154f76898ce090211a7c87675d9198a79a32c7ef59df870cfafea02c"
  end

  def install
    args = %W[
      --prefix=#{prefix}
      -Davahi=false
      -Dbuild-examples=false
      -Dbuild-tests=false
      -Dcocoa=true
      -Dembedded-lz4=false
      -Deeze=false
      -Dglib=true
      -Dlibmount=false
      -Dopengl=full
      -Dphysics=true
      -Dsystemd=false
      -Dv4l2=false
      -Dx11=false
    ]

    # Install in our Cellar - not dbus's
    inreplace "dbus-services/meson.build", "dep.get_pkgconfig_variable('session_bus_services_dir')",
                                           "'#{share}/dbus-1/services'"

    mkdir "build" do
      system "meson", *args, ".."
      system "ninja", "-v"
      system "ninja", "install", "-v"
    end
  end

  def post_install
    system Formula["shared-mime-info"].opt_bin/"update-mime-database", "#{HOMEBREW_PREFIX}/share/mime"
  end

  test do
    system bin/"edje_cc", "-V"
    system bin/"eet", "-V"
  end
end
