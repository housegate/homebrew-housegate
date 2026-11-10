class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.26.2/housegate-v0.26.2-darwin-arm64"
    sha256 "aefe379fb22c91eaaf4fc2783bf9c0ae78d1d56da9d37e30c62e1bc37beb6504"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.26.2/housegate-v0.26.2-linux-amd64"
    sha256 "52abf120aa1e0b8b223ff9476edacc716f6916b656b88e43333f18ef3a00e86b"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.26.2-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.26.2-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.26.2", shell_output("#{bin}/housegate --version")
  end
end
