#!/usr/local/bin/bash

declare -a open_list=("[" "(" "{")
declare -a close_list=("]" ")" "}")

get_close_index() {
  value=$1
  for j in "${!close_list[@]}"; do
    if [[ "${close_list[$j]}" = "${value}" ]]; then
        echo "$j"
        return
    fi
  done
}

main () {
  declare -a stack=()
  for (( i=0; i < ${#1}; i++ )); do
    if [[ "${open_list[*]}" =~ "${1:$i:1}" ]] ; then
      stack+=(${1:$i:1})
    elif [[ "${close_list[*]}" =~ "${1:$i:1}" ]] ; then
      pos=$(get_close_index ${1:$i:1})
      if (( ! ${#stack[@]} == 0 )) && [[ ${open_list[$pos]} = ${stack[-1]} ]] ; then
        unset 'stack[-1]'
      else
        echo "false"
        exit 0
      fi
    fi
  done

  if (( ${#stack[@]} == 0 )) ; then
    echo "true"
  else
    echo "false"
  fi
}

main "$@"

