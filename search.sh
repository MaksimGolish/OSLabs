#!/usr/bin/env bash

search () {
  if dir_exists $1 ; then
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
    printf "Can't find directory $x"
  done
  printf "Enter pattern: "
  read y
  search $x $y
}
