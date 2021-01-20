#!/usr/local/bin/bash

  main () {
    
    local -A colors

    colors=(
      ["Black"]="0"
      ["Brown"]="1"
      ["Red"]="2"
      ["Orange"]="3"
      ["Yellow"]="4"
      ["Green"]="5"
      ["Blue"]="6"
      ["Violet"]="7"
      ["Grey"]="8"
      ["White"]="9"
    )

    if [ -z "${colors["${1^}"]}" ] || [ -z "${colors["${2^}"]}" ]; then
      echo "invalid color"
      exit 1
    else
      echo "${colors["${1^}"]}${colors["${2^}"]}"
    fi
  }

  # call main with all of the positional arguments
  main "$@"
