#!/bin/bash
set -euo pipefail

check() {
  curl -s -o /dev/null -w '%{http_code}' "$1" || true
}

for i in $(seq 1 10); do
  home=$(check http://localhost/)
  deep=$(check http://localhost/some/deep/link)
  if [ "$home" = "200" ] && [ "$deep" = "200" ]; then
    echo "Service healthy (home=$home, deep link=$deep)"
    exit 0
  fi
  echo "Attempt $i: home=$home deep=$deep"
  sleep 3
done

echo "ValidateService failed" >&2
exit 1