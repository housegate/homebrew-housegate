class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.26.1/housegate-v0.26.1-darwin-arm64"
    sha256 "b181c153ee1f83002a0dedd11ba723842d0f9f362ded9c07e1fbef7a4eef7ec8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.26.1/housegate-v0.26.1-linux-amd64"
    sha256 "6781a608748e00668412dce42040dfb72b12d3af80d2ba96f781905c74129be9"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.26.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.26.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.26.1", shell_output("#{bin}/housegate --version")
  end
end
