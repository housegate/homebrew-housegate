class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.30.0/housegate-v0.30.0-darwin-arm64"
    sha256 "a6475c9c34c0aaf77725e68df1343c0b2ec5ffc33eebf835c23edcba9cee15c6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.30.0/housegate-v0.30.0-linux-amd64"
    sha256 "bad5ed148ddc2d27ce678c412bd7ca9a20543243df5e08ce8b64b8a19dba9b55"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.30.0-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.30.0-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.30.0", shell_output("#{bin}/housegate --version")
  end
end
