#!/usr/bin/env bash

search () {
  if [ -d "$1" ] ; then
    grep -r $2 $1 2> /dev/null
  else
    error "directory $1 does not exist"
  fi
}

interactive_search() {
  while :
  do
    printf "Enter directory: "
    read x
    [[ -d $x ]] && break
    printf "Can't find directory $x"
  done
  while :
  do
    printf "Enter pattern: "
    read y
  done
  search $x $y
}
