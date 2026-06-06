class Hbs2Peer < Formula
  desc "Hash-addressed distributed storage peer"
  homepage "https://github.com/NCrashed/hbs2"
  version "0.25.3.2"
  license "BSD-3-Clause"

  # Apple Silicon only. Intel users can fall back to
  # `nix run github:NCrashed/hbs2#hbs2-peer` or Docker.
  on_macos do
    on_arm do
      url "https://github.com/NCrashed/hbs2/releases/download/0.25.3.2/hbs2-0.25.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "1c0d3616b17e73923f3ebdd748718ff50b6984d913c6a33515ee3f00756a57a9"
    end
  end

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    pkgshare.install "README.txt"
  end

  def caveats
    <<~EOS
      hbs2-sync's "mount" subcommand requires macFUSE, available at:
        https://osxfuse.github.io/
      All other hbs2-sync subcommands work without it.

      First-run setup:
        hbs2-peer init
      Configuration lives in ~/.config/hbs2-peer/.

      To run hbs2-peer as a background service via launchd:
        brew services start hbs2-peer

      Logs:
        #{var}/log/hbs2-peer.log
    EOS
  end

  service do
    run [opt_bin/"hbs2-peer", "run"]
    keep_alive true
    log_path var/"log/hbs2-peer.log"
    error_log_path var/"log/hbs2-peer.log"
    working_dir Dir.home
  end

  test do
    system "#{bin}/hbs2-peer", "version"
  end
end
