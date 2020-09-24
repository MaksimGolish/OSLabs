#!/usr/bin/env bash

is_numeric() {
  re='^[0-9]+$'
  [[ $1 =~ $re ]] && return 0 || return 1
}

is_int() {
  re='^-?[0-9]+$'
  [[ $1 =~ $re ]] && return 0 || return 1
}

file_exists () {
  test -f "$1" && return 0 || return 1
}

dir_exists () {
  test -d "$1" && return 0 || return 1
}

is_readable() {
  test -r "$1" && return 0 || return 1
}

is_writeable() {
  test -w "$1" && return 0 || return 1
}
