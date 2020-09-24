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
  ! [[ $2 =~ $re ]] && invalid_arg "Arg 1 is not int"
  ! [[ $3 =~ $re ]] && invalid_arg "Arg 2 is not int"
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
