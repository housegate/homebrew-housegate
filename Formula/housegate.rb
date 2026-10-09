class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.17.2/housegate-v0.17.2-darwin-arm64"
    sha256 "49337237ada55c62fa7dcc7d8d763c0bf458f377a27be90c9c704bdf2da94538"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.17.2/housegate-v0.17.2-linux-amd64"
    sha256 "eefdc1b50baa5f7fcb2284abc6f3472fe66c9429f2dca799654a453e661925c8"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.17.2-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.17.2-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.17.2", shell_output("#{bin}/housegate --version")
  end
end
