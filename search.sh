#!/usr/bin/env bash

search () {
  if dir_exists $1 ; then
    ! is_readable $1 && error "directory is not readable"
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
    if [[ -d $x ]] ; then
      break
    fi
    printf "Can't find directory $x\n"
  done
  while :
  do
    printf "Enter pattern: "
    read y
    [[ ${#y} -ne 0 ]] && break
  done
  search $x $y
}
