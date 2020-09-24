#!/usr/bin/env bash

reverse() {
  ! file_exists $1 && error "file $1 not found"
  ! is_readable $1 && error "file $1 is not readable"
  if [ ! file_exists $2 ] ; then
    touch $2
  fi
  ! is_writeable $2 && error "file $2 is not writeable"
  tail -r $1 > $2
}

interactive_reverse() {
  while :
  do
    printf "Enter first file: "
    read x
    is_readable $x && break
    if file_exists $x ; then
      interactive_invalid_arg "File $x is not readable"
    else
      interactive_invalid_arg "File $x not found"
    fi
  done
  while :
  do
    printf "Enter second file: "
    read y
    if ! is_writeable $y && file_exists $y ; then
      interactive_invalid_arg "file $y is not writeable"
    else
      break
    fi
  done
  reverse $x $y
}
