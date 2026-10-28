class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.23.0/housegate-v0.23.0-darwin-arm64"
    sha256 "741010563bcf89b92360fee512248e14dfb8315db3b07314e25becd29ad5b6a9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.23.0/housegate-v0.23.0-linux-amd64"
    sha256 "3c22c19d897e810bc65b7ea3339ca4a95ff575af9100412bd2aa2ad44df6f907"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.23.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.23.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.23.0", shell_output("#{bin}/housegate --version")
  end
end
