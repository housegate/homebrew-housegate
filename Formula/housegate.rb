class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.2/housegate-v0.27.2-darwin-arm64"
    sha256 "52534e0f7f3add165fff431ac66836a12371e961b7568be671d1fbc1bd6ecf5a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.2/housegate-v0.27.2-linux-amd64"
    sha256 "10f40c64fb864c6f34916b85650b3e579edb6b4568d3c1d48370b024590b2cf9"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.2-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.2-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.2", shell_output("#{bin}/housegate --version")
  end
end
