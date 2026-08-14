class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.8.1/housegate-v0.8.1-darwin-arm64"
    sha256 "3307490a2146da1126db7051b6a05d5396f619ddc698b3a0b22aaad5bbdce78a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.8.1/housegate-v0.8.1-linux-amd64"
    sha256 "4021fdd1654e50e308139a1978670697f1a7c6a7a4e21a424a796044e57237f3"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.8.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.8.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.8.1", shell_output("#{bin}/housegate --version")
  end
end
