class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.32.0/housegate-v0.32.0-darwin-arm64"
    sha256 "95cd9bd1626ba564c78e230d77a81e591912c4fa7905e2e78daad1d8f3917355"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.32.0/housegate-v0.32.0-linux-amd64"
    sha256 "7f77314eff78d2150cfb4b4c57478874224b888dc994e963b9bd15f2f47e9501"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.32.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.32.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.32.0", shell_output("#{bin}/housegate --version")
  end
end
