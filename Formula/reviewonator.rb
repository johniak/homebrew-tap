class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.10.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.10.0/reviewonator-darwin-arm64.tar.gz"
      sha256 "64e993556d75db79475168844fed283244eca19a44260d19d60c75bb98619d66"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.10.0/reviewonator-darwin-x64.tar.gz"
      sha256 "15b214dcfabc4d4ded5d929cd7ea1ddf895043af887e6ef8b13f8c4bac4c62e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.10.0/reviewonator-linux-arm64.tar.gz"
      sha256 "063d5b8af710f6c6ca194db9d8ae7611fb3d5a415139db237f3a3513d0a858a1"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.10.0/reviewonator-linux-x64.tar.gz"
      sha256 "d86a4e3a268f7275873088129b22ccb668acb502a8a08aa8d0bdeb698e27c4fa"
    end
  end

  def install
    bin.install "reviewonator"
  end

  def caveats
    <<~EOS
      Run `#{opt_bin}/reviewonator setup` to install the Reviewonator skill for Claude Code or Codex.
      The full path runs this installation even when another reviewonator comes first on your PATH.
    EOS
  end

  test do
    assert_match "Reviewonator #{version}", shell_output("#{bin}/reviewonator --version")
  end
end
