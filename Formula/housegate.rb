class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.20.0/housegate-v0.20.0-darwin-arm64"
    sha256 "7e6863e25755cecee55c766d5747b99863032cbdf8ca4d240991974b029fa8b8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.20.0/housegate-v0.20.0-linux-amd64"
    sha256 "71cab473c391c966285d5fc058987cf7952cd15fe7f6d109d6be6e44558eac2f"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.20.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.20.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.20.0", shell_output("#{bin}/housegate --version")
  end
end
