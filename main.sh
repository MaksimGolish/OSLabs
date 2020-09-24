#!/usr/bin/env bash

source calculator.sh
source exceptions.sh
source check.sh
source search.sh
source log.sh
source interactive.sh

case $1 in
  calc )
    [[ $# -ne 4 ]] && wrong_args_amount
    calculate $2 $3 $4 ;;
  search )
    search "$2" "$3"
    ;;
  reverse )
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
    [[ $# -eq 2 ]] && is_numeric $2 && exit $2
    wrong_args_amount
    ;;
  interactive )
    interactive
    ;;
  * )
    invalid_arg "Function \"$1\" does not exist" ;;
esac
