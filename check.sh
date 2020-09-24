#!/usr/bin/env bash

is_numeric() {
  re='^[0-9]+$'
  [[ $1 =~ $re ]]
}

is_int() {
  re='^[+-]?[0-9]+$'
  [[ $1 =~ $re ]]
}

file_exists () {
  test -f "$1"
}

dir_exists () {
  test -d "$1"
}

is_readable() {
  test -r "$1"
}

is_writeable() {
  test -w "$1" 
}
