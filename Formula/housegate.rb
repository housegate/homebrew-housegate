class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.0/housegate-v0.27.0-darwin-arm64"
    sha256 "202f38f7d60634cab424a654c2bf54346559a44d8ff0da54a8ec5f60460c299b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.0/housegate-v0.27.0-linux-amd64"
    sha256 "46a0392d3912b75b1dbf2d97aabc51e7095d8cfedc6b9683e5e8de016200b45b"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.0", shell_output("#{bin}/housegate --version")
  end
end
