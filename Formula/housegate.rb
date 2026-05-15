class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  version "0.2.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.2.0/housegate-v0.2.0-darwin-arm64"
    sha256 "165a666196c7e07b90d0366b16362ef64f856ff56ae83193c0a0eab62deac687"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.2.0/housegate-v0.2.0-linux-amd64"
    sha256 "7d837e08e47f2e2be6f4a8078526b820bfcc220fe1f4ca26e2f89eb9adaf0531"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.2.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.2.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "secret-keygen", shell_output("#{bin}/housegate 2>&1", 1)
  end
end
