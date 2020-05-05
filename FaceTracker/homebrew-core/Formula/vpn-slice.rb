class VpnSlice < Formula
  include Language::Python::Virtualenv

  desc "Vpnc-script replacement for easy and secure split-tunnel VPN setup"
  homepage "https://github.com/dlenski/vpn-slice"
  url "https://github.com/dlenski/vpn-slice/archive/v0.13.tar.gz"
  sha256 "08f62c688b8e5f0a1f643593bd6d29c38ab92e3714a5108bfde762a3cdaf33df"
  head "https://github.com/dlenski/vpn-slice.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "d3f73c709b76bf6352d6bc96e1dbff36c9b78e46e55f98919ad0eeda9e09a557" => :catalina
    sha256 "8f71031401771af299feb50f010a7d8ad1e7baefcdbef7a6b159f52aba2f0c81" => :mojave
    sha256 "12f88ce821b7c462a6c80d6f72b396251662dfa20df6797b0aae1801665fb277" => :high_sierra
  end

  depends_on "python@3.8"

  resource "setproctitle" do
    url "https://files.pythonhosted.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3/setproctitle-1.1.10.tar.gz"
    sha256 "6283b7a58477dd8478fbb9e76defb37968ee4ba47b05ec1c053cb39638bd7398"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    # vpn-slice needs root/sudo credentials
    output = `#{bin}/vpn-slice 192.168.0.0/24 2>&1`
    assert_match "Cannot read\/write \/etc\/hosts", output
    assert_equal 1, $CHILD_STATUS.exitstatus
  end
end
