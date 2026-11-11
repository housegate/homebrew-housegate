class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.4/housegate-v0.27.4-darwin-arm64"
    sha256 "a90a6a7d71abf28056af5df482d89072eb858ac19eea15e8767972eb9490269c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.4/housegate-v0.27.4-linux-amd64"
    sha256 "8fb6b596b8b722e70e9df7620d5cf8081707a39aaaace7fdfbe7106a4313e83f"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.4-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.4-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.4", shell_output("#{bin}/housegate --version")
  end
end
