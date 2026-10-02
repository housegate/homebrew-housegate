class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.16.1/housegate-v0.16.1-darwin-arm64"
    sha256 "556c50b7bf0173a865ce5d4062e42e62114e5fbcc3b2a5fcebcd36dad7c4ce72"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.16.1/housegate-v0.16.1-linux-amd64"
    sha256 "c669d9f32094baeea5cad6f8d2b1674f624e170e615bb5671bc1feba723673e7"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.16.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.16.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.16.1", shell_output("#{bin}/housegate --version")
  end
end
