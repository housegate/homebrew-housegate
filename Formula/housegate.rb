class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.25.0/housegate-v0.25.0-darwin-arm64"
    sha256 "4a0c7e22bf65fc56c239dc1562f8df10223d394a1cd19fda161fd6060fa5849d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.25.0/housegate-v0.25.0-linux-amd64"
    sha256 "75118ea5a5df1152d81eb837899da85930e737143e7a242bfdace338a314cdd0"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.25.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.25.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.25.0", shell_output("#{bin}/housegate --version")
  end
end
