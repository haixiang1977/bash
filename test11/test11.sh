#!/bin/bash

df -h

# ask 'EXPRESSION {PROGRAM}' file(s)
df -h | awk '/udev/ { print $6 "\t: " $5 }'

