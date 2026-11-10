class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.26.5/housegate-v0.26.5-darwin-arm64"
    sha256 "c24ae55300e8371da63450dabf24340c07fbe615744a2909b010b032791d96b9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.26.5/housegate-v0.26.5-linux-amd64"
    sha256 "b642201617650ccdf7f161e9e32f6b639f5b05b930b916c74896df3550be328d"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.26.5-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.26.5-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.26.5", shell_output("#{bin}/housegate --version")
  end
end
