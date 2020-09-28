#!/usr/bin/env bash

log () {
  log_file="/var/log/anaconda/X.log"
  ! file_exists $log_file && error "File $log_file not found"
  ! is_readable $log_file && error "file $log_file is not readable"
  local warn=$(cat $log_file | awk '/\[/ && /WW/') &> /dev/null
  local inf=$(cat $log_file | awk '/\[/ && /II/') &> /dev/null
  local BLUE="\033[1;34m"
  local YELLOW='\033[1;33m'
  local NC="\033[0m"
  echo -e "${warn//"(WW)"/"${BLUE}Warn:${NC}"}"
  echo -e "${inf//"(II)"/"${YELLOW}Info:${NC}"}"
}
