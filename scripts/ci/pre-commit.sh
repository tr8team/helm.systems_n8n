#!/nix/var/nix/profiles/default/bin/nix-shell
#!nix-shell ../../nix/shells.nix -A ci -i bash
# shellcheck shell=bash
set -euo pipefail
pls setup
pre-commit run -c ./config/.pre-commit-config.yaml --all
