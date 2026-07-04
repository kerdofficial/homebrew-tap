class Upster < Formula
  desc "CLI client for the local Upster control plane"
  homepage "https://github.com/kerdofficial/upster"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-macos-arm64.tar.gz"
      sha256 "ed8a3af70ad03d3a290f63c82561cc5dadd502841f2998e1e41d2e850dffe145"
    else
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-macos-x64.tar.gz"
      sha256 "98f43ded4afa8289af31448beb74298b95d8773afb00d2818c3708b1ee59b3d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-linux-arm64.tar.gz"
      sha256 "5cb806d69ac9fffdc6bf28d4d7fcbf9c34fadb5b01012e0240060203833e3801"
    else
      url "https://github.com/kerdofficial/upster/releases/download/v#{version}/upster-linux-x64.tar.gz"
      sha256 "cc5335b2fee4e9c96c73086a63a2c5fc61bf38e328d29ac3f4eae82f9e8a515e"
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
        curl -Lo .env https://github.com/kerdofficial/upster/releases/latest/download/env.example
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
