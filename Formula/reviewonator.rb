class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.14.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.14.0/reviewonator-darwin-arm64.tar.gz"
      sha256 "a84483a8eb5e74dbca4a5521a0d363986b15f234fbd1098e02dd6ee41638a7d2"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.14.0/reviewonator-darwin-x64.tar.gz"
      sha256 "a42516726ab3394bf5ff974d01e45e8864a1243e45b8d2a454290ec993c2ad08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.14.0/reviewonator-linux-arm64.tar.gz"
      sha256 "10b4cee5ebbb50d56487ceb49fe8824c96b24e81614a35b07207eab145db45e8"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.14.0/reviewonator-linux-x64.tar.gz"
      sha256 "8e19b7e1bec609fdf8d26112db9fc8259cc0de184269488f82b490155101a92c"
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
