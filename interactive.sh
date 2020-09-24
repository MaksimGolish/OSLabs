#!/usr/bin/env bash
source calculator.sh

interactive() {
while :
do
  printf "<------------------------------------------------------------------------------>"
  printf "\nAvailable functions:\n1. calc\n2. search\n3. reverse\n4. strlen\n5. log\n6. exit\n7. help\n"
  printf "Type function number\n>>> "
  read func
  case $func in
    calc )
      printf "Choose function: \nsum\nsub\nmul\ndiv\n"
      printf ">>> "
      read calc_func
    while :
    do
      printf "Enter x: "
      read x
      if is_int $x; then
        break
      else
        echo "X is not int"
      fi
    done
    while :
    do
      printf "Enter y: "
      read y
      if is_int $y; then
        break
      else
        echo "Y is not int"
      fi
    done
      calculate $calc_func $x $y
      ;;

    search )
    while :
    do
      printf "Enter directory: "
      read x
    done
    while :
    do
      printf "Enter pattern: "
      read y
    done
    search $x $y
      ;;

    reverse )
    while :
    do
      printf "Enter first file: "
      read x
      printf "Enter second file: "
      read y
      tail -r $x > $y
    done
      ;;
      
    strlen )
      printf "Enter string: "
      read x
      echo ${#x}
      ;;

    log )
      log
      ;;
    exit )
      printf "Enter exit code: "
      read exit_code
      exit $exit_code
      ;;
    * )
      invalid_arg "Function \"$func\" does not exist" ;;
  esac
done
}
