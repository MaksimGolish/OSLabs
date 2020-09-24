#!/usr/bin/env bash

warn_out() {
  local BLUE="\033[1;34m"
  local NC="\033[0m"
  echo -e $(replace 'Warning:' "${BLUE}Warning: " "${BLUE}$@${NC}")
}

info_out() {
  local YELLOW='\033[1;35m'
  local NC='\033[0m'
  echo -e $(replace 'Warning:' "${YELLOW}Warning: " "${YELLOW}$@${NC}")
}

foreach() {
  while read value;
  do
	   eval "$* '$value'"
  done
}

replace() {
  local string="$3"
    echo "${string//$1/$2}"
}

grep_warn() {
  grep "(WW)" $log_file | foreach replace '\(WW\)' "Warning: "
}

grep_info() {
  grep "(II)" $log_file | foreach replace '\(II\)' "Info: "
}

log () {
  log_file="log/X.log"
  ! file_exists $log_file && error "File $log_file not found"
  ! is_readable $log_file && error "file $log_file is not readable"
  grep_warn | foreach warn_out
  grep_info | foreach info_out
}
