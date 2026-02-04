#!/usr/bin/env bash

startClient() {

  local ip=127.0.0.1
  local port=5555

  coproc NC (ncat "$ip" "$port" --no-shutdown)

  exec {sock_in}<&"${NC[0]}"
  exec {sock_out}>&"${NC[1]}"

  echo "Connected to $ip:$port" >&2

  # ---- receive loop (background)
  while IFS= read -r msg <&"$sock_in"; do
    handleMessage "$msg"
  done &
  local recv_pid=$!

  # ---- send loop (stdin)
  while IFS= read -r line; do
    printf '%s\n' "$line" >&"$sock_out"
  done

  kill "$recv_pid" 2>/dev/null
  kill "$NC_PID" 2>/dev/null
  wait "$recv_pid" "$NC_PID" 2>/dev/null

}
