#!/usr/bin/env bash

  main () {
    year=$1

    expr $1 + 1 > /dev/null 2>&1
    ret=$?

    if [ $# -ne 1 ] || [ ! $ret -lt 2 ]; then
        echo "Usage: leap.sh <year>"
    elif [ ! $(($year%4)) == 0 ] ; then
        echo "false"
    elif [ $(($year%100)) == 0 ] && [ ! $(($year%400)) == 0 ] ; then
        echo "false"
    else
        echo "true"
    fi
  }

  # call main with all of the positional arguments
  main $@

