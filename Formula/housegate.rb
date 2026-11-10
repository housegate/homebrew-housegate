class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.26.6/housegate-v0.26.6-darwin-arm64"
    sha256 "c8e17808e41accf320d7e2b843ee538f7a2a365a40e45873597d2e7ee29d53b6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.26.6/housegate-v0.26.6-linux-amd64"
    sha256 "c6cd9b6db84c776ac89e5102f8d82637b3517b573754af4a5e1e39144e045917"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.26.6-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.26.6-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.26.6", shell_output("#{bin}/housegate --version")
  end
end
