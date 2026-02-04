#!/usr/bin/env bash

source "./src/connection/shared.sh"

startServer() {
  local port=5555
  echo "Listening on port $port" >&2

  ncat -l "$port" --keep-open --no-shutdown 2>/dev/null |
    while IFS= read -r msg; do
      handleMessage "$msg"
    done
}
