class Upster < Formula
  desc "CLI client for the local Upster control plane"
  homepage "https://github.com/kerdofficial/upster"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-macos-arm64.tar.gz"
      sha256 "7292f7bdd721c3a6f44f875b9da7a1e50a0750a0aaa315e9284ca9840b2151a6"
    else
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-macos-x64.tar.gz"
      sha256 "e27daa135fdaa92df8ef6b2c2b3dfd466bf3b3cf50a2936ee5e756463ebbea65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-linux-arm64.tar.gz"
      sha256 "739d433f9c06624ee9e675ea92949cefd769bd69576a3f675910e83f6fa6b2d6"
    else
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-linux-x64.tar.gz"
      sha256 "cc1e6acf9067a80c21c471bfbd00c973cc8e0d93548c7a250021f8ddb6140c38"
    end
  end

  def install
    bin.install "upster"
  end

  def caveats
    <<~CAVEATS
      Upster CLI is a client for a local Upster control plane (dashboard + libSQL)
      that you run with Docker:

        mkdir upster && cd upster
        curl -LO https://github.com/kerdofficial/upster/releases/latest/download/docker-compose.yaml
        curl -Lo .env https://github.com/kerdofficial/upster/releases/latest/download/.env.example
        # edit .env, then:
        docker compose up -d
        upster auth setup

      Docs: upster --help  |  https://github.com/kerdofficial/upster
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/upster --version")
  end
end
