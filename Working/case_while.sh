#!/bin/bash
echo -n "Enter the pattern: "
read pattern

while [ $pattern != BREAK ]
do
   case $pattern in
    1)
      echo 1
      pattern=2
      ;;
    2)
      echo 2
      pattern=3
      ;;
    3)
      echo 3
      pattern=BREAK
      ;;
    4)
      echo 4
      pattern=5
      ;;
    5)
      echo 5
      pattern=BREAK
      ;;
    *)
      pattern=BREAK
      ;;
   esac
done
