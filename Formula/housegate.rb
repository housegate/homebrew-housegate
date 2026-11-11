class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.5/housegate-v0.27.5-darwin-arm64"
    sha256 "e09b4df211d6ace7093d58a7f42798e3d7e3463622b025207523b5ddbe205fcc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.5/housegate-v0.27.5-linux-amd64"
    sha256 "615e07200e1ecaab94710f74f4b7db9ec27af86da94a52ae1c7e424146ab63dc"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.5-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.5-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.5", shell_output("#{bin}/housegate --version")
  end
end
