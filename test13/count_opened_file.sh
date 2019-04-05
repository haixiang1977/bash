#!/bin/bash

# ls /proc/ &> x.txt

# run below with sodo for some process's privillage
input="/home/developer/temp/test/x.txt"
while IFS= read -r var
do
  echo "/proc/$var/fd"
  ls /proc/$var/fd | wc -l
done < "$input"
