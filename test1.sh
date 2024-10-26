#!/bin/bash

for i in {1..100}; do
  if (( i % 3 == 0 && i % 5 == 0 )); then
    echo "$i es múltiplo de los 2"
  elif (( i % 3 == 0 )); then
    echo "$i es múltiplo de 3"
  elif (( i % 5 == 0 )); then
    echo "$i es múltiplo de 5"
  fi
done
