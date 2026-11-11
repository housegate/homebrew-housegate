class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.8/housegate-v0.27.8-darwin-arm64"
    sha256 "8ffcc3cf8de3d850f106ef46081b63db37e4b6f5aee35eb697d071155c116d7a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.8/housegate-v0.27.8-linux-amd64"
    sha256 "ce17fec6a8a9cf8d80a4b13621717a49a0e9f13d5e5aa2b747c87cd5b65a487f"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.8-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.8-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.8", shell_output("#{bin}/housegate --version")
  end
end
