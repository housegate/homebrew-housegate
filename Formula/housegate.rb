class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.15.0/housegate-v0.15.0-darwin-arm64"
    sha256 "ef8e77460519bd2bb702c90727014bc4abef0f10b49e0527d34a69232399c400"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.15.0/housegate-v0.15.0-linux-amd64"
    sha256 "54fd4257f8a563f3e3cfa9bc4214210769b1a2dcfaa39a06626571c9fc05cfab"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.15.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.15.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.15.0", shell_output("#{bin}/housegate --version")
  end
end
