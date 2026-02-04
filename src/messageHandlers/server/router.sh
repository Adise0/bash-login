handleServerMessage() {
  local client=$1
  local message=$2
  echo "Message from [$client]: $message" >&2
}
