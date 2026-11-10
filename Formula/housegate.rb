class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.26.3/housegate-v0.26.3-darwin-arm64"
    sha256 "7e3dfb36daad02434c9252d93840165614db3296cc2c9a788961bd86038357ac"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.26.3/housegate-v0.26.3-linux-amd64"
    sha256 "1659f4762fe7c2f49d2c66b189944a27e75c3e29c3509e569139fce398fc0729"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.26.3-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.26.3-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.26.3", shell_output("#{bin}/housegate --version")
  end
end
