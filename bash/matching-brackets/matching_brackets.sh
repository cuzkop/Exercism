#!/usr/local/bin/bash

declare -a open_list=("[" "(" "{")
declare -a close_list=("]" ")" "}")
pos=0

get_close_index() {
  value=$1
  for j in "${!close_list[@]}"; do
    if [[ "${close_list[$j]}" = "${value}" ]]; then
        pos=${j};
    fi
  done
}

main () {
  declare -a stack=()
  for (( i=0; i < ${#1}; i++ )); do
    if [[ "${open_list[@]}" =~ "${1:$i:1}" ]] ; then
      stack=("${stack[@]}" ${1:$i:1})
    elif [[ "${close_list[@]}" =~ "${1:$i:1}" ]] ; then
      get_close_index ${1:$i:1}
      if (( ! ${#stack[@]} == 0 )) && [[ ${open_list[$pos]} == ${stack[-1]} ]] ; then
        stack=(${stack[@]:0:((${#stack[@]}-1))})
      else
        echo "false"
        exit 0
      fi
    fi
  done

  if (( ${#stack[@]} == 0 )) ; then
    echo "true"
    exit 0
  else
    echo "false"
    exit 0
  fi
}

main "$@"

