class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.12.1"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.12.1/reviewonator-darwin-arm64.tar.gz"
      sha256 "abda7166c09231c20e7f07d70b235a58d22ab435a175185660f31899e2b345c1"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.12.1/reviewonator-darwin-x64.tar.gz"
      sha256 "a5b99ac109a815de67c15e770fafceaa5ccaf1a3f4c47b153b9f5595b7114639"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.12.1/reviewonator-linux-arm64.tar.gz"
      sha256 "79930c4f2b5193e569cede1503bcdc473ec71a8b7374b97015cfa7ef5bca4522"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.12.1/reviewonator-linux-x64.tar.gz"
      sha256 "0e148c035de6c0cf0e4ca3199a6911df25c199adf1aa1506704451fe6a8276d4"
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
