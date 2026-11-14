class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.28.1/housegate-v0.28.1-darwin-arm64"
    sha256 "39354522c06a2fe701e54b01bdd2a68b7883f042c573b4e0a0616b378076be9f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.28.1/housegate-v0.28.1-linux-amd64"
    sha256 "71c8b4bf9da222fe00c71671ab41824243ba2d066d55e68ef6dea7e01df5a5ea"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.28.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.28.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.28.1", shell_output("#{bin}/housegate --version")
  end
end
