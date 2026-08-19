class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.9.0/housegate-v0.9.0-darwin-arm64"
    sha256 "2dcd498ff89e24d394266da9551b65716ae9360f81e88d391e737075b3e254b7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.9.0/housegate-v0.9.0-linux-amd64"
    sha256 "5522a414a7e56cfd00dfe88460650613677e945d2968a4a56b6b0a19a9667046"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.9.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.9.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.9.0", shell_output("#{bin}/housegate --version")
  end
end
