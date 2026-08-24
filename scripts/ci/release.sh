#!/bin/sh

# sg release installs its semantic-release toolchain unpinned at run time; the
# current latest versions need node >= 20 while this env ships node 18.17
# (yarn: "The engine node is incompatible ... Got 18.17.1"). Freeze to the last
# node18-compatible matrix (semantic-release 22 era) via a yarn shim.
# Same class as tradecharlie#7927 / gotradeindo#8292 / tradecrmtwo#3817.
RELEASE_SHIM_REAL_BIN="$(command -v yarn)" || {
  echo "release.sh: yarn not found in PATH, cannot pin release deps" >&2
  exit 1
}
export RELEASE_SHIM_REAL_BIN
SHIM_DIR="$(mktemp -d)"
cat > "$SHIM_DIR/yarn" <<'SH'
#!/bin/sh
if [ -z "$RELEASE_SHIM_REAL_BIN" ]; then
  echo "release-shim: RELEASE_SHIM_REAL_BIN not set" >&2
  exit 1
fi
n=$#; i=0
while [ "$i" -lt "$n" ]; do
  a=$1; shift
  case "$a" in
  semantic-release) a="semantic-release@^22.0.12" ;;
  conventional-changelog-conventionalcommits) a="conventional-changelog-conventionalcommits@^7.0.2" ;;
  "@semantic-release/commit-analyzer") a="@semantic-release/commit-analyzer@^11.1.0" ;;
  "@semantic-release/release-notes-generator") a="@semantic-release/release-notes-generator@^12.1.0" ;;
  "@semantic-release/changelog") a="@semantic-release/changelog@^6.0.3" ;;
  "@semantic-release/exec") a="@semantic-release/exec@^6.0.3" ;;
  "@semantic-release/git") a="@semantic-release/git@^10.0.1" ;;
  "@semantic-release/github") a="@semantic-release/github@^9.2.6" ;;
  esac
  set -- "$@" "$a"
  i=$((i + 1))
done
exec "$RELEASE_SHIM_REAL_BIN" "$@"
SH
chmod +x "$SHIM_DIR/yarn"

PATH="$SHIM_DIR:$PATH" sg release
