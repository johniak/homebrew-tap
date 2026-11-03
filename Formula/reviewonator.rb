class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.11.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.11.0/reviewonator-darwin-arm64.tar.gz"
      sha256 "11c53a2e4bdf11e22aa84c031965b93924a85ccd5acd00794d1379cb2a53d05f"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.11.0/reviewonator-darwin-x64.tar.gz"
      sha256 "97ba09ac093bcb068377982e75d326207baa1278c784261690b067d62b4048b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.11.0/reviewonator-linux-arm64.tar.gz"
      sha256 "ade9993a259d801e6c21b4b665fa96c5eb650255b07daaf1d86a72d7781af4aa"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.11.0/reviewonator-linux-x64.tar.gz"
      sha256 "2844358c7c6901042aef1e614da80ef959a26cd68b7ff4077173605da2526468"
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
