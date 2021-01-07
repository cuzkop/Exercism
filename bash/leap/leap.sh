#!/usr/bin/env bash

  main () {
    year=$1
    if [ ! $(($year%4)) == 0 ] ; then
        echo "false"
    elif [　$(($year%100)) == 0 ] && [ ! $(($year%400)) == 0 ] ; then
        echo "false"
    else
        echo "true"
    fi
  }

  # call main with all of the positional arguments
  main $1

