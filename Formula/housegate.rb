class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.16.0/housegate-v0.16.0-darwin-arm64"
    sha256 "566f000b53bd7685532b70be77b8e4ee84f01bfc7e2c7131f1a87e3548836003"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.16.0/housegate-v0.16.0-linux-amd64"
    sha256 "6c1471566c11612bfccb518d7909e715f91074fb27482ec4a7c9f1a5550007f9"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.16.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.16.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.16.0", shell_output("#{bin}/housegate --version")
  end
end
