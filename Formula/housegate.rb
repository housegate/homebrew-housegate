class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  version "0.7.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.7.1/housegate-v0.7.1-darwin-arm64"
    sha256 "a328988cdea7bacde9dda341253daccc8568e6f1628d17b02e81e4d3e59434a8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.7.1/housegate-v0.7.1-linux-amd64"
    sha256 "2e12b9cc4478df2d0bab71893be1316ce9919e2f5afb9fe593adfd9f8f90a9e9"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.7.1-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.7.1-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.7.1", shell_output("#{bin}/housegate --version")
  end
end
