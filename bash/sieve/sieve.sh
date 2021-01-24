#!/usr/bin/env bash

is_prime() {
  n=$1
  if ((n == 1)); then
    echo false
    return
  fi

  s=$((`echo "sqrt("$n")"|bc`+1))
  for ((j=2; j<$s; j++)); do
    r=$(($n%$j))
    if (( $r == 0 )); then  
      echo false
      return
    fi
  done

  echo true
  return
}

main () {
  ans=""
  
  for ((i=0; i<$1; i++)); do
    prime=$(is_prime $(($i+1)))
    if [[ $prime == true ]]; then
      ans="$ans $(($i+1))"
    fi
  done
  echo $ans
}



# call main with all of the positional arguments
main "$@"