#!/nix/var/nix/profiles/default/bin/nix-shell
#!nix-shell ../../nix/shells.nix -A cd -i bash
# shellcheck shell=bash
set -euo pipefail

export VERSION="$1"
gomplate -f ./chart/Chart.tpl.yaml -o ./chart/Chart.yaml
gomplate -f ./chart/values.tpl.yaml -o ./chart/values.yaml

pls update
helm-docs ./chart
