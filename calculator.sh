#!/usr/bin/env bash

sum() {
  let "res = $1+$2"
  echo $res
}

sub() {
  let "res = $1-$2"
  echo $res
}

mul() {
  let res = "$1*$2"
  echo $res
}

div() {
  [[ $2 -eq 0 ]] && error "division by zero"
  let "res = $1 / $2"
  echo $res
}

is_numeric() {
  re='^[0-9]+$'
  [[ "$1 =~ $re" ]] && return 0 || return 1
}

calculate() {
  re='^[+-]?[0-9]+$'
  ! is_int $2 && invalid_arg "arg 1 is not int"
  ! is_int $3 && invalid_arg "arg 2 is not int"
  case $1 in
    sum )
      sum $2 $3;;
    sub )
      sub $2 $3;;
    mul )
      mul $2 $3;;
    div )
      div $2 $3;;
  esac
}

interactive_calculator() {
  printf "Choose function: \nsum\nsub\nmul\ndiv\n"
  printf ">>> "
  read calc_func
  while :
  do
    printf "Enter x: "
    read x
    if is_int $x; then
      break
    else
      echo "X is not int"
    fi
  done
  while :
  do
    printf "Enter y: "
    read y
    if is_int $y; then
      break
    else
      echo "Y is not int"
    fi
  done
    calculate $calc_func $x $y
}
