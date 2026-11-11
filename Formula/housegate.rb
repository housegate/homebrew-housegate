class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.9/housegate-v0.27.9-darwin-arm64"
    sha256 "1c345701c9939b1dbb3a301d026eaf6ca10dfc05be1eefb20aafc7c87741e065"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.9/housegate-v0.27.9-linux-amd64"
    sha256 "ce2a55bfaa79aba8e14e6bf25c06bcc920fa5cb92480fe0f5edcaada6576f228"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.9-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.9-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.9", shell_output("#{bin}/housegate --version")
  end
end
