#!/usr/bin/env bash

strlen() {
  echo ${#2}
}

interactive_strlen() {
  printf "Enter string\n>>>  "
  IFS= read -r x
  echo ${#x}
}
