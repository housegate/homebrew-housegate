class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.23.1/housegate-v0.23.1-darwin-arm64"
    sha256 "76447a39bf01b895827115c0d63f98ff2b2dd208cf9dbd02cd2153837aa9969d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.23.1/housegate-v0.23.1-linux-amd64"
    sha256 "e9554300b3e97d1e9ac98dd0d223d03acd792452cf3bd62e9c1e4b817fb6e9fe"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.23.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.23.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.23.1", shell_output("#{bin}/housegate --version")
  end
end
