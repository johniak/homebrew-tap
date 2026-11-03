class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.9.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.9.0/reviewonator-darwin-arm64.tar.gz"
      sha256 "e9894dcc780004a240710626b98629de3cecc26ec12345d3959beba5dd5554bd"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.9.0/reviewonator-darwin-x64.tar.gz"
      sha256 "b332c9f2133e3e8182d66db1715b9de70b598ac788890d723f6e457041142edb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.9.0/reviewonator-linux-arm64.tar.gz"
      sha256 "2062d540fe75a6a0924b1a8549dec53204801ddcfa77641c18afba5ef06b7771"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.9.0/reviewonator-linux-x64.tar.gz"
      sha256 "da74d6fb7d09ba3c730dd8dcc9e8b6fef33c3cec6cbbf2db508a2c08e30de06a"
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
