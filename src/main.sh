#!/bin/bash

source "./src/utils/prompt.sh"
source "./src/connection/client.sh"
source "./src/connection/server.sh"

result=$(prompt "Choose an option" "Server" "Client")

case $result in
0) startServer ;;
1) startClient ;;
esac
