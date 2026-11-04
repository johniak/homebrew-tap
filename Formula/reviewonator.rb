class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.13.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.13.0/reviewonator-darwin-arm64.tar.gz"
      sha256 "006af2b14c28942586d9f9631f649dabdc9dea9cf3898aab9fd54e2ce06d617d"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.13.0/reviewonator-darwin-x64.tar.gz"
      sha256 "e4e299f2f5b3fe4fc9025a5beccaa06f6343c2f88c267cfe47a1ce81ecb0eeeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.13.0/reviewonator-linux-arm64.tar.gz"
      sha256 "94b371baea4e4d0b78b75aaf3c0d62bb028d2bcb6021ff9168d08bc2eaa1223b"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.13.0/reviewonator-linux-x64.tar.gz"
      sha256 "d935a3bb0c64ace7e81d3020d91f1f436a00a31fe6c2b0d64b315080f7bfdcb6"
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
