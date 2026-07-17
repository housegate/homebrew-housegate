class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  version "0.6.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.6.0/housegate-v0.6.0-darwin-arm64"
    sha256 "cd4e4aa9004ff5d79f4cf4c04b82d9062634fe29d2525c26131472d2140e04f7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.6.0/housegate-v0.6.0-linux-amd64"
    sha256 "d927f5141304e0b2b4222dca8f53418fe6bfeea6c3f759e363984d3234609ac8"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.6.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.6.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.6.0", shell_output("#{bin}/housegate --version")
  end
end
