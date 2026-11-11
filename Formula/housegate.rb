class Housegate < Formula
  desc "ClickHouse native TCP proxy"
  homepage "https://github.com/housegate/housegate"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/housegate/housegate/releases/download/v0.27.11/housegate-v0.27.11-darwin-arm64"
    sha256 "bf570d41ef204978225d283c75e2d69529dbe1474aa972c0ca4cd5e40dab7043"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/housegate/housegate/releases/download/v0.27.11/housegate-v0.27.11-linux-amd64"
    sha256 "d7d403b475a9130b4c15dc53535849f1ad6939574caacd91bfa9398ff19c08ed"
  end

  def install
    if OS.mac?
      bin.install "housegate-v0.27.11-darwin-arm64" => "housegate"
    else
      bin.install "housegate-v0.27.11-linux-amd64" => "housegate"
    end
  end

  test do
    assert_match "housegate v0.27.11", shell_output("#{bin}/housegate --version")
  end
end
