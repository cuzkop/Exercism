#!/usr/bin/env bash

  main () {
    copy=$1
    len=${#copy}

    for((i=$len-1;i>=0;i--)); do rev="$rev${copy:$i:1}"; done

    echo "$rev"
  }

  # call main with all of the positional arguments
  main "$1"
