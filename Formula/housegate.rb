class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.9.3/housegate-v0.9.3-darwin-arm64"
    sha256 "3fc56ea9c20ce108f821b844ae656071807bc9ba63e1944358eb4f37a53daebf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.9.3/housegate-v0.9.3-linux-amd64"
    sha256 "7eebdd0dfc84d6575e4b343755fc289863d688458e24dce59f87c41e5d6221ca"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.9.3-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.9.3-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.9.3", shell_output("#{bin}/housegate --version")
  end
end
