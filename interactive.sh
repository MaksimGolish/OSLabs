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
  printf "Type function\n>>> "
  read func
  case $func in
    calc | "1" )
      interactive_calculator
      ;;
    search | "2" )
      interactive_search
      ;;
    reverse | "3" )
      interactive_reverse
      ;;
    strlen | "4" )
      interactive_strlen
      ;;
    log | "5" )
      log
      ;;
    exit | "6" )
      while :
      do
        printf "Enter exit code: "
        read exit_code
        is_int $exit_code && break
      done
      exit $exit_code
      ;;
    help )
      help
      ;;
    * )
      interactive_invalid_arg "Function \"$func\" does not exist" ;;
  esac
  printf "Wanna continue? [y/N]\n>>> "
  while :
  do
    read decision
    case $decision in
      y )
        break ;;
      N )
        exit 0 ;;
      * )
        printf ">>> "
        continue ;;
    esac
  done
done
}
