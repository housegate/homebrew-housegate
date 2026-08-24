class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.10.0/housegate-v0.10.0-darwin-arm64"
    sha256 "6f960337e1208bccecf8d12c33937b81af0c5a86ed214a6b804e3c785492234a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.10.0/housegate-v0.10.0-linux-amd64"
    sha256 "96361ec348998f8cf2866c3e6ac0f78b89b59ba82b5e4321321fe436fddabaef"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.10.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.10.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.10.0", shell_output("#{bin}/housegate --version")
  end
end
