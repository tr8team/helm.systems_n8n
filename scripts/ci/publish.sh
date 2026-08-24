#!/bin/bash
# Runs inside `nix develop .#cd` (see cicd.yml) — the legacy nix-shell shebang
# pointed at /nix/var/nix/profiles/default/bin/nix-shell which no longer exists
# on the runners (exit 126).
set -euo pipefail

export VERSION="$1"
gomplate -f ./chart/Chart.tpl.yaml -o ./chart/Chart.yaml
gomplate -f ./chart/values.tpl.yaml -o ./chart/values.yaml

pls update
helm-docs ./chart
