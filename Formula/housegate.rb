class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.9.4/housegate-v0.9.4-darwin-arm64"
    sha256 "c770c755209430a7fddf9b56028147cceecfa53aa982b4ae4af4837c0571db75"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.9.4/housegate-v0.9.4-linux-amd64"
    sha256 "e3e7ce1f6834b88c3ffcb68713af8a4342cb40603f2920abf310acc806c007a3"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.9.4-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.9.4-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.9.4", shell_output("#{bin}/housegate --version")
  end
end
