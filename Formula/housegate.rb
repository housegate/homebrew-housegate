class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.17.0/housegate-v0.17.0-darwin-arm64"
    sha256 "647cc0cb94a0ccc6d49345ba63fc81fbb593032ae684fb7597b91de5b027fc6f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.17.0/housegate-v0.17.0-linux-amd64"
    sha256 "fe4e5afc8de47df10e3f60f12d84105fa972085c1ff541a88f364ed9374c471f"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.17.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.17.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.17.0", shell_output("#{bin}/housegate --version")
  end
end
