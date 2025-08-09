class ShellrestGo < Formula
  desc "Async SSH-like REST API (SSH over HTTP) with async jobs and Bearer auth"
  homepage "https://github.com/zk-armor/shellrest-go"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/zk-armor/shellrest-go/releases/download/v0.1.1/shellrest-go_darwin_arm64.tar.gz"
      sha256 "3b580fb15617a5c6b5da70c9e91f095198ba95620b44f72c46ee459389aa9c49"
    end
    on_intel do
      url "https://github.com/zk-armor/shellrest-go/releases/download/v0.1.1/shellrest-go_darwin_amd64.tar.gz"
      sha256 "4f95ae2c59d265b3fa66af1f15ec593cf0176ec4436c01c4e6e87adf287f88cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zk-armor/shellrest-go/releases/download/v0.1.1/shellrest-go_linux_arm64.tar.gz"
      sha256 "8e5953ba4b9d214c40a6a2ea64b8ceee668a4608da6838d8d7a1f5ea01ca301b"
    end
    on_intel do
      url "https://github.com/zk-armor/shellrest-go/releases/download/v0.1.1/shellrest-go_linux_amd64.tar.gz"
      sha256 "d20478edb1565ce3378781ad53270742b07f73f4b48ce7967a0edc361509e7f5"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "shellrest-go_darwin_arm64" => "shellrest-go"
      else
        bin.install "shellrest-go_darwin_amd64" => "shellrest-go"
      end
    else
      if Hardware::CPU.arm?
        bin.install "shellrest-go_linux_arm64" => "shellrest-go"
      else
        bin.install "shellrest-go_linux_amd64" => "shellrest-go"
      end
    end

    (etc/"shellrest").mkpath
    conf = etc/"shellrest/sshrest.conf"
    unless conf.exist?
      if File.exist?("sshrest.conf")
        etc.install "sshrest.conf" => "shellrest/sshrest.conf"
      else
        conf.write <<~EOS
          # shellrest-go config
          SRG_LISTEN_ADDR=:8080
          SRG_AUTH_KEYS_PATH=/etc/ssh/authorized_keys
          SRG_EXEC_TIMEOUT=120s
        EOS
      end
    end
  end

  service do
    run [opt_bin/"shellrest-go", "--config", etc/"shellrest/sshrest.conf"]
    keep_alive true
    log_path var/"log/shellrest-go.log"
    error_log_path var/"log/shellrest-go-error.log"
    working_dir var
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/shellrest-go --help")
  end
end
