# typed: false
# frozen_string_literal: true

class GeminiBox < Formula
  desc "A portable box for the Google Gemini CLI"
  homepage "https://github.com/zk-armor/homebrew-tap"
  url "https://github.com/zk-armor/homebrew-tap/releases/download/v0.1.0/gemini-box.tar.gz"
  sha256 "9d9895d8f49f83f774e7f3de65c43aa6e94db19282e9bbc83e4e54f3f9a9c200"
  version "0.1.0"

  def install
    # The tarball contains a single directory 'gemini-box', so we move its contents
    # to the formula's prefix.
    libexec.install Dir["*"]
    
    # Create a symlink to the executable script in the standard Homebrew bin directory
    # so the user can run it from anywhere.
    bin.install_symlink libexec/"run-gemini.sh" => "gemini-box"
  end

  test do
    # A simple test to check if the executable runs and returns a version or help command.
    # Since gemini-cli might not have a --version flag, we check for help output.
    assert_match "Usage: gemini [command]", shell_output("#{bin}/gemini-box help")
  end
end
