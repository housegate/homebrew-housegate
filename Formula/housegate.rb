class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.31.1/housegate-v0.31.1-darwin-arm64"
    sha256 "e1eadd1198e675477aa202b587aaed33774a69b8cf11b60833f9fdefd7e29fbc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.31.1/housegate-v0.31.1-linux-amd64"
    sha256 "0a365247471c228f07204b5cfed5c4972cacef321c5d50ece21e4e9b175f33be"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.31.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.31.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.31.1", shell_output("#{bin}/housegate --version")
  end
end
