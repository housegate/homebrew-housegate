class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.19.0/housegate-v0.19.0-darwin-arm64"
    sha256 "b5e8e55991780101c01e4f20b7b4ea570b09393ba0c884bbe9bf7bc5776df366"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.19.0/housegate-v0.19.0-linux-amd64"
    sha256 "3de95490102ec4822957b599d34f7fd6c1a324c611e81438300379f9798955c3"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.19.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.19.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.19.0", shell_output("#{bin}/housegate --version")
  end
end
