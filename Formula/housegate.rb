class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.10/housegate-v0.27.10-darwin-arm64"
    sha256 "1a3413a67d5739bd9eb0da0251259cb2f4b643999b8a7f5f805f23e4c867fbdb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.10/housegate-v0.27.10-linux-amd64"
    sha256 "8e111293272316e7309af34cfa621cbbc0079492dcce124d19066f31362f1258"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.10-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.10-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.10", shell_output("#{bin}/housegate --version")
  end
end
