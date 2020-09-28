#!/usr/bin/env bash

sum() {
  res=$(($1+$2))
  echo $res
}

sub() {
  res=$(($1-$2))
  echo $res
}

mul() {
  res=$(($1*$2))
  echo $res
}

div() {
  [[ $2 -eq 0 ]] && error "division by zero"
  res=$(($1/$2))
  echo $res
}

calculate() {
  ! is_int $2 && invalid_arg "arg 1 is not int"
  ! is_int $3 && invalid_arg "arg 2 is not int"
  case $1 in
    sum | "1" )
      sum $2 $3;;
    sub | "2" )
      sub $2 $3;;
    mul | "3" )
      mul $2 $3;;
    div | "4" )
      div $2 $3;;
  esac
}

interactive_calculator() {
  printf "Choose function: \n1. sum\n2. sub\n3. mul\n4. div"
  functions=(sum sub mul div)
  while :
  do
    printf "\n>>> "
    read calc_func
    [[ " ${functions[*]} " == *" ${calc_func} "* ]] && break
    printf "Invalid arg"
  done
  while :
  do
    printf "Enter x: "
    read x
    ! [[ $x -eq $x ]] 2> /dev/null && interactive_invalid_arg "not int" && continue
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
    ! [[ $y -eq $y ]] 2> /dev/null && interactive_invalid_arg "not int" && continue
    if [ "$calc_func"="div" ] && [[ $y -eq 0 ]] ; then
      interactive_invalid_arg "division by zero"
      continue
    fi
    if is_int $y; then
      break
    else
      echo "Y is not int"
    fi
  done
    calculate $calc_func $x $y
}
