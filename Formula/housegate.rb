class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.31.0/housegate-v0.31.0-darwin-arm64"
    sha256 "a5845e53bfe018f930211a13f0d688d0133a4ea334a94c75c842d9d47b6f9923"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.31.0/housegate-v0.31.0-linux-amd64"
    sha256 "2b63c89b71b3f1f819cfea8d86259477d955e96701c4dec36b276aaf935d695c"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.31.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.31.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.31.0", shell_output("#{bin}/housegate --version")
  end
end
