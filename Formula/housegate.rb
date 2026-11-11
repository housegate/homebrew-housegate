class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.7/housegate-v0.27.7-darwin-arm64"
    sha256 "425fdf2d0d31105f92d4813c9d942ae2ab7dcb5a3886bf41ddc5abdcf53d589c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.7/housegate-v0.27.7-linux-amd64"
    sha256 "d0c47d262fc541d6955d77dd2bd17854a6f723af489555f2751785b5a48ca3a8"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.7-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.7-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.7", shell_output("#{bin}/housegate --version")
  end
end
