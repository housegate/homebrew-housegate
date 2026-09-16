class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.13.0/housegate-v0.13.0-darwin-arm64"
    sha256 "986f7f21aead1f01fe2c78452f9f9e58ff21268e7bfb3d35cb8f900fef13fbec"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.13.0/housegate-v0.13.0-linux-amd64"
    sha256 "a1dffc747eb40bd91643ced5e18f197d27c418eff700e59fe719f1beccaad64d"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.13.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.13.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.13.0", shell_output("#{bin}/housegate --version")
  end
end
