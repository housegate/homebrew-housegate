class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.3/housegate-v0.27.3-darwin-arm64"
    sha256 "cae279a1933f2dd48cba48fd202439cea1dde4960b35f3b08d7466654d5adae1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.3/housegate-v0.27.3-linux-amd64"
    sha256 "06a41d514486cf37d9a672368d60f1ad63ce2c76862f726e61d00cd9eca10a9f"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.3-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.3-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.3", shell_output("#{bin}/housegate --version")
  end
end
