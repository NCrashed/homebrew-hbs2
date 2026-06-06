# homebrew-hbs2

Homebrew tap for [hbs2](https://github.com/NCrashed/hbs2) — hash-addressed
distributed storage.

## Install

```sh
brew install ncrashed/hbs2/hbs2-peer
```

This installs the full CLI suite (`hbs2-peer`, `hbs2-cli`, `hbs2-sync`,
`hbs2-keyman`, `hbs2-git3`, `git-hbs2`, `git-remote-hbs23`, `ncq3`) from a
pre-built Apple Silicon bundle attached to the matching
[GitHub Release](https://github.com/NCrashed/hbs2/releases).

Apple Silicon (aarch64) only. On Intel Macs use
`nix run github:NCrashed/hbs2#hbs2-peer` or Docker.

## Run the peer as a service

```sh
hbs2-peer init        # first-run setup, before starting the service
brew services start hbs2-peer
```

## Updating the formula

Bundles are produced by
[`scripts/bundle-darwin.sh`](https://github.com/NCrashed/hbs2/blob/master/scripts/bundle-darwin.sh)
in the main repository. For a new release: run the script, upload the
tarball + `.sha256` to the release, then bump `version`, `url` and `sha256`
in [`Formula/hbs2-peer.rb`](Formula/hbs2-peer.rb).
