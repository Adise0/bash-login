#!/usr/bin/env bash

source "./src/messageHandlers/server/router.sh"

startServer() {
  clear
  echo "Starting server...." >&2

  local port=5555

  coproc NC (ncat -l "$port" --no-shutdown)

  exec {sock_in}<&"${NC[0]}"
  exec {sock_out}>&"${NC[1]}"

  echo "Listening on port $port" >&2

  while IFS= read -r msg <&"$sock_in"; do
    handleServerMessage "$msg"
    printf 'Bounce: %s\n' "$msg" >&"$sock_out"
  done
}
