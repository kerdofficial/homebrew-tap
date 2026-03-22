class Wd < Formula
  desc "Workspace Director - fast project navigation CLI"
  homepage "https://github.com/kerdofficial/wd"
  version "1.3.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kerdofficial/wd/releases/download/v#{version}/wd-macos-arm64.tar.gz"
      sha256 "93c06bab6817e554755a1abf6f9318f0faef4497b8fd8815d38d66e5075ecf28"
    else
      url "https://github.com/kerdofficial/wd/releases/download/v#{version}/wd-macos-x64.tar.gz"
      sha256 "9656cf64bdc15fc7a69fe974154e48555b57feea017719b00ba212b0bccd5074"
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
