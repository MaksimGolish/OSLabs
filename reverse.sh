#!/usr/bin/env bash

reverse() {
  ! file_exists $1 && error "file $1 not found"
  ! is_readable $1 && error "file $1 is not readable"
  if [ ! file_exists $2 ] ; then
    touch $2
  fi
  ! is_writeable $2 && error "file $2 is not writeable"
  tail -r $2 > $3
}

interactive_reverse() {
  while :
  do
    printf "Enter first file: "
    read x
    [[ -r $x ]] && break
    if [[ -f $x ]] ; then
      interactive_invalid_arg "File $x is not readable"
    else
      interactive_invalid_arg "File $x not found"
    fi
  done
  while :
  do
    printf "Enter second file: "
    read y
    if ![[ -w $y ]] && [[ -f $y ]] ; then
      interactive_invalid_arg "file $y is not writeable"
    else
      break
    fi
  done
  tail -r $x > $y
}
