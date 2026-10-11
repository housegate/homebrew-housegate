class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.18.0/housegate-v0.18.0-darwin-arm64"
    sha256 "51862a69a7454327b7d14d8a24530edc0835180b1c2a2ff734d44d54dac303e8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.18.0/housegate-v0.18.0-linux-amd64"
    sha256 "765141655366aa344bd0e2c039ed7a6edc8db2419ae5d48c74ed2b449f77067a"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.18.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.18.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.18.0", shell_output("#{bin}/housegate --version")
  end
end
