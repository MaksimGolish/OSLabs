#!/usr/bin/env bash
help () {
  if [[ $# -eq 0 ]]; then
    cat help/calchelp.txt
    cat help/exithelp.txt
    cat help/loghelp.txt
    cat help/revhelp.txt
    cat help/searchhelp.txt
    cat help/strhelp.txt
  elif [[ $# -eq 1 ]] ; then
    case $1 in
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
      error "no documentation found for $1"
    esac
  else
    wrong_args_amount
  fi
}
