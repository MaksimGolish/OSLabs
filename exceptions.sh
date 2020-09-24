#!/usr/bin/env bash



error() {
  echo "Error: $1" >> /dev/stderr
  exit 1
}

invalid_arg() {
  echo "Invalid arg: $1" >> /dev/stderr
  exit 1
}

wrong_args_amount() {
  echo "Wrong args amount" 
  exit 1
}
