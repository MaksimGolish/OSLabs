#!/usr/bin/env bash

reverse() {
  ! file_exists $1 && error "file $1 not found"
  ! is_readable $1 && error "file $1 is not readable"
  if [ ! file_exists $2 ] ; then
    touch $2
  ! is_writeable $2 && error "file $2 is not writeable"
  tail -r $2 > $3
}
