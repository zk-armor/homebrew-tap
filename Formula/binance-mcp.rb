class BinanceMcp < Formula
  desc "MCP server exposing Binance read-only tools"
  homepage "https://github.com/zk-armor/cursor-trader"
  url "https://github.com/zk-armor/homebrew-tap/releases/download/v0.1.2/binance_mcp-0.1.2.tar.gz"
  sha256 "d76c04d25642f8d3b950159f20bd250135782679c4d98df6827d7cbe4be6979b"
  license "MIT"
  version "0.1.2"

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
