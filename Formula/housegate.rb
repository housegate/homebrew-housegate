class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.6/housegate-v0.27.6-darwin-arm64"
    sha256 "97696f6957667fa11098d06eefca1a270c9e0a6264e8544b6faeffa9eb39e39d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.6/housegate-v0.27.6-linux-amd64"
    sha256 "463291dcee9b055a0a103caa055ac3e4453a9bce71b128cbec1845daf2f178fe"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.6-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.6-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.6", shell_output("#{bin}/housegate --version")
  end
end
