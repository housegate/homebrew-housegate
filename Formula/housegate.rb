class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.21.0/housegate-v0.21.0-darwin-arm64"
    sha256 "ed63bda8efcee25ec4eb4b25329c4e7aee808506eb7ed72f87b031e2b77d89e8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.21.0/housegate-v0.21.0-linux-amd64"
    sha256 "490dcb453e7e86fb945ec996740f1fcc53503f2070edd0e1b905ab32d215fd17"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.21.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.21.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.21.0", shell_output("#{bin}/housegate --version")
  end
end
