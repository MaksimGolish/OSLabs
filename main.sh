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
    calculate $2 $3 $4
    exit 0 ;;
  search )
    [[ $# -ne 3 ]] && wrong_args_amount
    search $2 $3
    exit 0 ;;
  reverse )
    [[ $# -ne 3 ]] && wrong_args_amount
    reverse $2 $3
    exit 0 ;;
  strlen )
    [[ $# -ne 2 ]] && wrong_args_amount
    echo ${#2}
    exit 0 ;;
  log )
    [[ $# -ne 1 ]] && wrong_args_amount
    log
    exit 0 ;;
  exit )
    [[ $# -eq 1 ]] && exit 0
    [[ $# -eq 2 ]] && is_numeric $2 && exit $2
    [[ $# -eq 2 ]] && error "exit code $2 is not numeric"
    wrong_args_amount
    exit 0 ;;
  interactive )
    [[ $# -ne 1 ]] && wrong_args_amount
    interactive
    exit 0 ;;
  help )
    [[ $# -gt 2 ]] && wrong_args_amount
    help ${@:2}
    exit 0 ;;
  * )
    invalid_arg "Function \"$1\" does not exist" ;;
esac
