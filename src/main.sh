#!/bin/bash

source "./src/utils/prompt.sh"

result=$(prompt "Choose an option" "opt1" "opt2" "opt3")

echo Result is $result
