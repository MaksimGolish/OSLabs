#!/usr/bin/env bash

import () {
  if [[ -r $1 ]] ; then
    source $1
  else
    missing_file $1
  fi
}

import calculator.sh
import exceptions.sh
import check.sh
import search.sh
import log.sh
import interactive.sh
import reverse.sh
import help.sh

case $1 in
  calc )
    [[ $# -ne 4 ]] && wrong_args_amount
    calculate $2 $3 $4 ;;
  search )
    [[ $# -ne 3 ]] && wrong_args_amount
    search $2 $3
    ;;
  reverse )
    [[ $# -ne 3 ]] && wrong_args_amount
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
  help )
    [[ $# -gt 2 ]] && wrong_args_amount
    help ${@:2}
    ;;
  * )
    invalid_arg "Function \"$1\" does not exist" ;;
esac
