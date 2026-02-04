#!/usr/bin/env bash

source "./src/messageHandlers/server/router.sh"

handleNewConnection() {
  local peer="${NCAT_REMOTE_ADDR:-unknown}:${NCAT_REMOTE_PORT:-unknown}"

  while IFS= read -r msg; do
    handleServerMessage "$peer" "$msg"
    printf "Bounce: %s\n" "$msg"
  done
}

export -f handleNewConnection

startServer() {

  clear
  echo "Starting server...." >&2

  local port=5555

  ncat -l "$port" -k --no-shutdown -c 'bash -lc "source ./src/messageHandlers/server/router.sh; handleNewConnection"'
  echo "Server listening on port $port" >&2
}
