class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.14.1/housegate-v0.14.1-darwin-arm64"
    sha256 "82127cbce60038bc3321622b567fe11e98ccf70ef4af561636d992efc255ba94"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.14.1/housegate-v0.14.1-linux-amd64"
    sha256 "8d0c5f5f70dfa689583e84a10388f10a8e59f47b6cc7f6a032b5456ca9373c26"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.14.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.14.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.14.1", shell_output("#{bin}/housegate --version")
  end
end
