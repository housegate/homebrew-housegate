class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.26.0/housegate-v0.26.0-darwin-arm64"
    sha256 "52dbd4f2971f5dbc8a7c3f6d1106bd9f7c71556b945971bf301384fffcc4fd94"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.26.0/housegate-v0.26.0-linux-amd64"
    sha256 "e42ee36f9d2bb6d9d1d37d5ff6cab4d204fc2f65fc0fd8423f7c01368cc52f6c"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.26.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.26.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.26.0", shell_output("#{bin}/housegate --version")
  end
end
