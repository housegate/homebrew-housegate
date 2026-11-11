class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.12/housegate-v0.27.12-darwin-arm64"
    sha256 "babf4e1fa41b79a5b3ceb29a38d7afb6cca2b691d30695f75f5176ea46f6c650"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.12/housegate-v0.27.12-linux-amd64"
    sha256 "fc9e6b1276c823617a44bbc9b1cb7163c66a3ba4d4e5cdbabd5379dc36a8dd1d"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.12-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.12-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.12", shell_output("#{bin}/housegate --version")
  end
end
