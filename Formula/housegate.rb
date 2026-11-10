class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.26.4/housegate-v0.26.4-darwin-arm64"
    sha256 "b3fe801116d64bec31fb3ef2c24f5ae824bb4bcd24a7e2845fb511f2f9f4c629"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.26.4/housegate-v0.26.4-linux-amd64"
    sha256 "702eb1226d394136f96708ad006c20307d560567b27782fb3ce61d1d30176b90"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.26.4-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.26.4-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.26.4", shell_output("#{bin}/housegate --version")
  end
end
