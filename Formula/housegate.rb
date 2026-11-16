class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.29.0/housegate-v0.29.0-darwin-arm64"
    sha256 "5f4c1c74feffed829448f5afc6066c5c40833f624ba39cc8415f683404a3065d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.29.0/housegate-v0.29.0-linux-amd64"
    sha256 "33166223629f62288c9843b1f71089f9e0300eacf28ce9757a9772773052cb51"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.29.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.29.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.29.0", shell_output("#{bin}/housegate --version")
  end
end
