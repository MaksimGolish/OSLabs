#!/usr/bin/env bash

source calculator.sh
source exceptions.sh
source check.sh
source search.sh
source log.sh
source interactive.sh
source reverse.sh

case $1 in
  calc )
    [[ $# -ne 4 ]] && wrong_args_amount
    calculate $2 $3 $4 ;;
  search )
    search "$2" "$3"
    ;;
  reverse )
    [[ $# -ne 4 ]] && wrong_args_amount
    reverse $2 $3
    ;;
  strlen )
    [[ $# -ne 2 ]] && wrong_args_amount
    echo ${#2}
    ;;
  log )
    [[ $# -ne 1 ]] && wrong_args_amount
    log
    ;;
  exit )
    [[ $# -eq 1 ]] && exit 0
    [[ $# -eq 2 ]] && is_int $2 && exit $2
    [[ $# -eq 2 ]] && error "exit code $2 is not int"
    wrong_args_amount
    ;;
  interactive )
    [[ $# -ne 1 ]] && wrong_args_amount
    interactive
    ;;
  * )
    invalid_arg "Function \"$1\" does not exist" ;;
esac
