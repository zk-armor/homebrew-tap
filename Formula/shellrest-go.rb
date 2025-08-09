class ShellrestGo < Formula
  desc "Async SSH-like REST API (SSH over HTTP) with async jobs and Bearer auth"
  homepage "https://github.com/zk-armor/shellrest-go"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/zk-armor/shellrest-go/releases/download/v0.1.2/shellrest-go_darwin_arm64.tar.gz"
      sha256 "21394e669ae4884f8ed872f7bf79c18ee8fc1adbdca51d04993a6aad199de11b"
    end
    on_intel do
      url "https://github.com/zk-armor/shellrest-go/releases/download/v0.1.2/shellrest-go_darwin_amd64.tar.gz"
      sha256 "319308666956085540dc4baa5de92a649b4826aa889f2ef5f10457403254f173"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zk-armor/shellrest-go/releases/download/v0.1.2/shellrest-go_linux_arm64.tar.gz"
      sha256 "ea5b95b1859092642548cc48aa6095d9f4429d29ab6cc750da50d1fe5ce9ca7f"
    end
    on_intel do
      url "https://github.com/zk-armor/shellrest-go/releases/download/v0.1.2/shellrest-go_linux_amd64.tar.gz"
      sha256 "0e25b7544278a2ae0ed8cd69792fb2852dacce0d2aade617ad5750c57a30fd7c"
    end
  end

  def install
    target = case
             when OS.mac? && Hardware::CPU.arm? then "shellrest-go_darwin_arm64"
             when OS.mac? then "shellrest-go_darwin_amd64"
             when Hardware::CPU.arm? then "shellrest-go_linux_arm64"
             else "shellrest-go_linux_amd64"
             end
    bin.install target => "shellrest-go"
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
