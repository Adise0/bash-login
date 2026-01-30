

BLUE="\033[38;5;45m"
RESET="\033[0m"

print() {
  printf '%s\n' "$text"

  for i in "${!options[@]}"; do

  local line=""
    if [[ $currentOption == $i ]]; then line+=$BLUE; fi
    line+="$((i+1)) - ${options[$i]}"
if [[ $currentOption == $i ]]; then line+=$RESET; fi
    printf "%b$line%b\n" ;
  done
}

prompt() {
  local text="$1"
  shift 1
  local options=("$@")
  local currentOption=0
  local nOfOptions=$((${#options[@]} - 1))
  local currentOption=0

  print

  # echo "$text"
  # for i in "${!options[@]}"; do
  #   echo "${options[$i]}"
  # done
  

  # for option in "${options[@]}"; do

  # done

    # while true; do
    # IFS= read -rsn1 -t 0.5 key < /dev/tty || key=''

    # if [[ $key == $'\e' ]]; then
    #     IFS= read -rsn2 -t 0.05 rest < /dev/tty || rest=''
    #     key+="$rest"
    # fi

    # case "$key" in
    #     $'\e[A'|$'\eOA') echo "Up" ;;
    #     $'\e[B'|$'\eOB') echo "Down" ;;
    #     $'\n'|$'\r') echo "Enter"; break ;;
    #     '') continue ;; 
    #     *) printf 'Got: %q\n' "$key" ;;
    # esac
  # done
}
