#!/usr/bin/env bash

search () {
  if [ -d "$1" ] ; then
    grep -r $2 $1
  else
    error "directory $1 does not exist"
  fi
}
