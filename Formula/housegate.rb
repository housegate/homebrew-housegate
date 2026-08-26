class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.12.0/housegate-v0.12.0-darwin-arm64"
    sha256 "9feb98420b71c3558b0edebeee9ff527f7eb73a135361e1d431c1a6e178b5fb5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.12.0/housegate-v0.12.0-linux-amd64"
    sha256 "ac3da1f8ed0021c50f40277caaa27ca369b02598112731a7be310252d047a7e7"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.12.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.12.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.12.0", shell_output("#{bin}/housegate --version")
  end
end
