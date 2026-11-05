class Reviewonator < Formula
  desc "Local human-in-the-loop interface for AI-generated GitHub pull request reviews"
  homepage "https://github.com/johniak/reviewonator"
  version "0.13.1"
  license "MIT"

  depends_on "gh"

  on_macos do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.13.1/reviewonator-darwin-arm64.tar.gz"
      sha256 "5400e05276f72a6443ddfda7990395e108569c78be76e984a3f3a51cbdde7e04"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.13.1/reviewonator-darwin-x64.tar.gz"
      sha256 "7af48407d1a72257e3f544dc046664b7b67e578e9d3fe54ab981872c214b6796"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/johniak/reviewonator/releases/download/v0.13.1/reviewonator-linux-arm64.tar.gz"
      sha256 "394210d898c1bb03678533f76f734b26355754a8aeb63c1a009b68ac479111c0"
    end
    on_intel do
      url "https://github.com/johniak/reviewonator/releases/download/v0.13.1/reviewonator-linux-x64.tar.gz"
      sha256 "3c94ad49bf9e5433bea84777645b1846ad85eb28c90b4d29395b6d8b4124042a"
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
