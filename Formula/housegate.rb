class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.9.5/housegate-v0.9.5-darwin-arm64"
    sha256 "a6b22519aa4df97b45dc71a593a535e8660deb06b20e12042baa3317460402f2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.9.5/housegate-v0.9.5-linux-amd64"
    sha256 "058b517a5d0efe1a72709551c2af2b30f2c982d524d22d0d3ca7a9bd59d0d8ad"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.9.5-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.9.5-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.9.5", shell_output("#{bin}/housegate --version")
  end
end
