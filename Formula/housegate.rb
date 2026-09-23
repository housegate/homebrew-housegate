class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.14.0/housegate-v0.14.0-darwin-arm64"
    sha256 "6168d7acc12b8b01eccebd17d02ef33e061446aa0b56b6826adce5af4a700a10"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.14.0/housegate-v0.14.0-linux-amd64"
    sha256 "b62b32c48a58ba218a0b36f0464c793cd3ba40484631a45184a6228ab5a9f52a"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.14.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.14.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.14.0", shell_output("#{bin}/housegate --version")
  end
end
