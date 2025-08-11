class BinanceMcp < Formula
  desc "MCP server exposing Binance read-only tools"
  homepage "https://github.com/zk-armor/cursor-trader"
  url "https://github.com/zk-armor/homebrew-tap/releases/download/v0.1.1/binance_mcp-0.1.0.tar.gz"
  sha256 "cff7de5d3c99cd3b0884e51d46d95e24a79a8f1ed0263edb87fa6f887766dacd"
  license "MIT"
  version "0.1.1"

  depends_on "uv"

  def install
    bin.install_symlink Formula["uv"].opt_bin/"uvx" => "binance-mcp-server"
  end

  def caveats
    <<~EOS
      This formula provides a launcher that runs the server via uvx.
      Usage:
        BINANCE_API_KEY=... BINANCE_API_SECRET=... binance-mcp-server

      To pin a specific wheel or change source, edit this formula.
    EOS
  end

  test do
    system "#{bin}/binance-mcp-server", "--help"
  end
end
