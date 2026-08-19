class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.9.2/housegate-v0.9.2-darwin-arm64"
    sha256 "de61edceecaa6c58f77ab137c854982bcb190b1f575e4b5cf8717f9ab9210e88"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.9.2/housegate-v0.9.2-linux-amd64"
    sha256 "bb7ff2eeac1a8d320f01dfc02f1d85f8804ff427274932d07f374c530544570e"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.9.2-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.9.2-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.9.2", shell_output("#{bin}/housegate --version")
  end
end
