#!/usr/bin/env bash

set -euo pipefail

version="$(yq '.version' ./chart/Chart.yaml)"
export VERSION="$version"
gomplate -f ./chart/Chart.tpl.yaml -o ./chart/Chart.yaml
gomplate -f ./chart/values.tpl.yaml -o ./chart/values.yaml
