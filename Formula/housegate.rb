class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.1/housegate-v0.27.1-darwin-arm64"
    sha256 "ca80b39edaf899a2f3caad65af8ad34712ebc8aa161dee7ebee9ef8f4f1670a1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.1/housegate-v0.27.1-linux-amd64"
    sha256 "3beaffb36b7ae9e6d9a941e57962782c30b85a2dd7db3c5fb15f09393a7ea017"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.1", shell_output("#{bin}/housegate --version")
  end
end
