class BinanceMcp < Formula
  desc "MCP server exposing Binance read-only tools"
  homepage "https://github.com/zk-armor/cursor-trader"
  version "0.1.1"
  # This formula installs a lightweight wrapper that runs the server via uvx
  depends_on "uv"

  def install
    (bin/"binance-mcp-server").write <<~EOS
      #!/bin/sh
      exec uvx --from https://github.com/zk-armor/homebrew-tap/releases/download/v#{version}/binance_mcp-0.1.0-py3-none-any.whl binance-mcp-server "$@"
    EOS
  end

  test do
    system "#{bin}/binance-mcp-server", "--help"
  end
end
