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
  help )
    if [[ $# -eq 1 ]]; then
      cat help/calchelp.txt
      cat help/exithelp.txt
      cat help/loghelp.txt
      cat help/revhelp.txt
      cat help/searchhelp.txt
      cat help/strhelp.txt
    elif [[ $# -eq 2 ]] ; then
      case $2 in
        calc )
        cat help/calchelp.txt
          ;;
        exit )
        cat help/exithelp.txt
          ;;
        log )
        cat help/loghelp.txt
          ;;
        reverse )
        cat help/revhelp.txt
          ;;
        search )
        cat help/searchhelp.txt
          ;;
        strlen )
        cat help/strhelp.txt
          ;;
        * )
        error "no documentation found for $2"
      esac
    else
      wrong_args_amount
    fi
    ;;
  * )
    invalid_arg "Function \"$1\" does not exist" ;;
esac
