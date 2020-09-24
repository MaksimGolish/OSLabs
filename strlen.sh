#!/usr/bin/env bash

strlen() {
  echo ${#2}
}

interactive_strlen() {
  printf "Enter string: "
  read x
  echo ${#x}
}
