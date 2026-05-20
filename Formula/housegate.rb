class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  version "0.3.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.3.0/housegate-v0.3.0-darwin-arm64"
    sha256 "cec3114cfa1905acbd27a9f0a1f8058973ec014fc94ca2a7f7ab2cfc54253c13"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.3.0/housegate-v0.3.0-linux-amd64"
    sha256 "24a7a9a74b847acc733cfeea818cdaed47e3176c36d7ac9c3d4bdc391bdd9f12"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.3.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.3.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.3.0", shell_output("#{bin}/housegate --version")
  end
end
