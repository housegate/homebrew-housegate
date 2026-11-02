class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.24.0/housegate-v0.24.0-darwin-arm64"
    sha256 "c3cbe69737013f504f7fdcfc9366701fa97d4705858ce9fc8e6701866515592c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.24.0/housegate-v0.24.0-linux-amd64"
    sha256 "16beee40e45eb72dc33a39572c9f2a7d72823b75059258f0b2e76752683d7a7a"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.24.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.24.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.24.0", shell_output("#{bin}/housegate --version")
  end
end
