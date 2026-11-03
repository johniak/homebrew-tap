class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.9.1"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.9.1/reviewonator-darwin-arm64.tar.gz"
      sha256 "efa8331aa9a14aa2af143f1954602bea65ae13ca3efc115ecaec184cf07e3789"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.9.1/reviewonator-darwin-x64.tar.gz"
      sha256 "59c0d8b251ee912735a02dc4446317b21e07b3bf3cd05b3fdba94f198f27c984"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.9.1/reviewonator-linux-arm64.tar.gz"
      sha256 "9691df539ebd94cb90accb9f39e3d7eab8b11086887c22be27fda5e198038f7f"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.9.1/reviewonator-linux-x64.tar.gz"
      sha256 "67695d104a29db8855bdb39cd001af9c49fcf21b4221a73aff211aa1c07082bd"
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
