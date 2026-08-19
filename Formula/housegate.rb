class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.9.1/housegate-v0.9.1-darwin-arm64"
    sha256 "2e3a438eafc31e57ea3d5922d0cc72d3b708f70c1bf269eaafab32f36a44686d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.9.1/housegate-v0.9.1-linux-amd64"
    sha256 "440cd511a86edb3e83d091bbf99865a7d1a2df3d4f21fdd47d2d206ffc61f754"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.9.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.9.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.9.1", shell_output("#{bin}/housegate --version")
  end
end
