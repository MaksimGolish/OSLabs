#!/usr/bin/env bash
source calculator.sh
source reverse.sh
source search.sh
source strlen.sh
source log.sh

interactive() {
while :
do
  printf "<------------------------------------------------------------------------------>"
  printf "\nAvailable functions:\n1. calc\n2. search\n3. reverse\n4. strlen\n5. log\n6. exit\n7. help\n"
  printf "Type function number\n>>> "
  read func
  case $func in
    calc )
      interactive_calculator
      ;;
    search )
      interactive_search
      ;;
    reverse )
      interactive_reverse
      ;;
    strlen )
      interactive_strlen
      ;;
    log )
      log
      ;;
    exit )
      while :
      do
        printf "Enter exit code: "
        read exit_code
        is_int $exit_code && break
      done
      exit $exit_code
      ;;
    * )
      interactive_invalid_arg "Function \"$func\" does not exist" ;;
  esac
  while :
  do
    printf "Wanna continue? [y/N]\n>>> "
    read decision
    case $decision in
      y )
        break ;;
      N )
        exit 0 ;;
      * )
        continue ;;
    esac
  done
done
}
