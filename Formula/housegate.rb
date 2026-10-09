class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.17.3/housegate-v0.17.3-darwin-arm64"
    sha256 "05cb3550fb03c424a6a5a8df0d188971c02514466a9355ba51ef1cad8b07fb74"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.17.3/housegate-v0.17.3-linux-amd64"
    sha256 "b47f2e90991f61174d009db209a3abc05500423dcd275f6acd0f6da29363258d"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.17.3-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.17.3-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.17.3", shell_output("#{bin}/housegate --version")
  end
end
