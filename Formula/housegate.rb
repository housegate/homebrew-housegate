class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.17.1/housegate-v0.17.1-darwin-arm64"
    sha256 "d124a7f9856ecbe127f2e9d213b6f4f4f4b66ae2b917a1fd2ea121dfd6074f7d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.17.1/housegate-v0.17.1-linux-amd64"
    sha256 "d7322e69711493ed0af0c3e71545d598b610f29398f70ec9200b07b40b4555e3"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.17.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.17.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.17.1", shell_output("#{bin}/housegate --version")
  end
end
