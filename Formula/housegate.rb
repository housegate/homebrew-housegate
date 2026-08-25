class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.11.0/housegate-v0.11.0-darwin-arm64"
    sha256 "201bdc7e68f0e8a443e2a70e6adbad2bb4715b46eec4f9ec17648411b7466767"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.11.0/housegate-v0.11.0-linux-amd64"
    sha256 "570ec3c1c10150b2412c5c611e643fee1628804c31a6c5aca1771730dd26d2c9"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.11.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.11.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.11.0", shell_output("#{bin}/housegate --version")
  end
end
