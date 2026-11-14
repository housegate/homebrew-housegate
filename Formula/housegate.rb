class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.28.2/housegate-v0.28.2-darwin-arm64"
    sha256 "f98622fe2727f5188f7a1065b1e0e215b9eddd6175489c0aded28c0ac108eb90"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.28.2/housegate-v0.28.2-linux-amd64"
    sha256 "88b7ffe4e0505734df9f0f001c79a0fd78f3eaa2a7f1d31f323323b52907d4aa"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.28.2-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.28.2-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.28.2", shell_output("#{bin}/housegate --version")
  end
end
