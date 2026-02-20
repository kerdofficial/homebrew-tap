class Wd < Formula
  desc "Workspace Director - fast project navigation CLI"
  homepage "https://github.com/kerdofficial/wd"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/wd/releases/download/v#{version}/wd-macos-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/kerdofficial/wd/releases/download/v#{version}/wd-macos-x64.tar.gz"
      sha256 "PLACEHOLDER"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wd-bin --version")
  end
end
