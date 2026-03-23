class Wd < Formula
  desc "Workspace Director - fast project navigation CLI"
  homepage "https://github.com/kerdofficial/wd"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/wd/releases/download/v#{version}/wd-macos-arm64.tar.gz"
      sha256 "8eba1e18ae33b6b216f8a5f4a77871dc86a7f2c3cefb5559f65333c50337cdfe"
    else
      url "https://github.com/kerdofficial/wd/releases/download/v#{version}/wd-macos-x64.tar.gz"
      sha256 "f68c90a3d1007c9afddf30fe663e44fb29dd13d283a5f2cb5d3ccb486bc2b5ff"
    end
  end

  def install
    bin.install "wd-bin"
    pkgshare.install "wd.zsh"
  end

  def caveats
    <<~EOS
      Add this to your ~/.zshrc:

        source #{HOMEBREW_PREFIX}/share/wd/wd.zsh

      Then reload: source ~/.zshrc
      First-time setup: wd setup

      Coming soon: bash, fish, PowerShell, and Nushell support
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wd-bin --version")
  end
end
