class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.13.1/housegate-v0.13.1-darwin-arm64"
    sha256 "f3ef8fef46dc6b0fa0fb7e8cb96bc72f9c7e2f203e01003b45e4c0ae31e11994"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.13.1/housegate-v0.13.1-linux-amd64"
    sha256 "edd2317ff44e91dfe5ae0cf84eda97ec962b1dfb477c89eb3a70ec6998afc43e"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.13.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.13.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.13.1", shell_output("#{bin}/housegate --version")
  end
end
