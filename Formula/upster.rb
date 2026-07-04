class Upster < Formula
  desc "CLI client for the local Upster control plane"
  homepage "https://github.com/kerdofficial/upster"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-macos-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-macos-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-linux-x64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "upster"
  end

  def caveats
    <<~EOS
      Upster CLI is a client for a local Upster control plane (dashboard + libSQL)
      that you run with Docker:

        mkdir upster && cd upster
        curl -LO https://github.com/kerdofficial/upster/releases/latest/download/docker-compose.yaml
        curl -Lo .env https://github.com/kerdofficial/upster/releases/latest/download/.env.example
        # edit .env, then:
        docker compose up -d
        upster auth setup

      Docs: upster --help  |  https://github.com/kerdofficial/upster
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/upster --version")
  end
end
