#!/bin/bash

# IFS stands for "internal field separator". It is used by the shell to determine how to do word splitting, i. e. how to recognize word boundaries.

#The default value for IFS consists of whitespace characters (to be precise: space, tab and newline). Each character can be a word boundary.
echo "default IFS $IFS"

mystring="foo:bar baz rab"
for word in $mystring; do
  echo "Word: $word"
done


# Now, try setting IFS=:
IFS=":"
echo "IFS $IFS"

for word in $mystring; do
  echo "Word: $word"
done

