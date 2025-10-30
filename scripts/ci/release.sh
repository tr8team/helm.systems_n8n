#!/nix/var/nix/profiles/default/bin/nix-shell
#!nix-shell ../../nix/shells.nix -A cd -i bash
# shellcheck shell=bash
set -euo pipefail
sg release
