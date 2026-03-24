class Wd < Formula
  desc "Workspace Director - fast project navigation CLI"
  homepage "https://github.com/kerdofficial/wd"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/wd/releases/download/v#{version}/wd-macos-arm64.tar.gz"
      sha256 "c3b1460c09bb023468633aace889d17b022634bbafb283994d9f49115afa7c48"
    else
      url "https://github.com/kerdofficial/wd/releases/download/v#{version}/wd-macos-x64.tar.gz"
      sha256 "1b579fb79c35c3c3105eb6774483e356a91c827621f84a443ff7f749180ae3e7"
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
