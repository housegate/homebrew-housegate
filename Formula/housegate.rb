class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  version "0.7.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.7.0/housegate-v0.7.0-darwin-arm64"
    sha256 "2e8de36a8525d63b464b2bb6815902835beef8e0fd26ab4d6928b9810d9a5909"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.7.0/housegate-v0.7.0-linux-amd64"
    sha256 "2f2a36a66edb0d1b434946de20aae6713af0241646f673a09e5ddb2b94205aa9"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.7.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.7.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.7.0", shell_output("#{bin}/housegate --version")
  end
end
