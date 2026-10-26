class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.22.0/housegate-v0.22.0-darwin-arm64"
    sha256 "6e02e59d75c7f55d67f654aa11bc920923601fc58b6612ef1916ae6f8c070011"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.22.0/housegate-v0.22.0-linux-amd64"
    sha256 "9cdb78863884b73b09d80f7f3ab86b2049429c69de7add4a521f9fc389eb8a3a"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.22.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.22.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.22.0", shell_output("#{bin}/housegate --version")
  end
end
