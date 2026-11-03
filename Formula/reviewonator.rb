class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.12.0"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.12.0/reviewonator-darwin-arm64.tar.gz"
      sha256 "980ae9f991ff515cef56463e45b60e3dc0a4907809110bb782146c7bae245a28"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.12.0/reviewonator-darwin-x64.tar.gz"
      sha256 "5c4cfa7ac9f5dd38c5401987515ca421f511ef061e44dbe04c7dd58aebf6a908"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.12.0/reviewonator-linux-arm64.tar.gz"
      sha256 "b8b3d4571c076f8f41b1a6e0f45c34b3a3a14531d2464fc8006435742050f07f"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.12.0/reviewonator-linux-x64.tar.gz"
      sha256 "7136e8602e7929f4ef7897e7606b79ece8cedc2cf4d0166e4d2385e71ef5e069"
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
