class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.26.7/housegate-v0.26.7-darwin-arm64"
    sha256 "68b7cbd3b5350b2822605b89b53746d89694f6a3e447dff224a8bacbc01cfa8c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.26.7/housegate-v0.26.7-linux-amd64"
    sha256 "a6047ffb7b0be1b6d995a3f67a0e08ff5cc1bbc4934e153ee43cb623cec71cb8"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.26.7-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.26.7-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.26.7", shell_output("#{bin}/housegate --version")
  end
end
