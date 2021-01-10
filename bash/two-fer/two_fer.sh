#!/usr/bin/env bash

main () {
  name=$1

  if (( $# == 0 )) ; then
    name="you"
  fi

  echo "One for $name, one for me."
}

# call main with all of the positional arguments
main "$@"

