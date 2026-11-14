class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.28.0/housegate-v0.28.0-darwin-arm64"
    sha256 "3d88b4163fd43b92e2b6370aac3f2f437c8b53b55295272a33c476ee25f5746a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.28.0/housegate-v0.28.0-linux-amd64"
    sha256 "d6cf3f7e59b44d3754274b84341b7f114dd4be13906f8b558ec6637e91b7f7a9"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.28.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.28.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.28.0", shell_output("#{bin}/housegate --version")
  end
end
