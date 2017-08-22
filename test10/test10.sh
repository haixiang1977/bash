#!/bin/bash

# diference between [] and [[]]

# https://stackoverflow.com/questions/3427872/whats-the-difference-between-and-in-bash/3427931#3427931
# [[ is bash's improvement to the [ command.

# 1. [[ handles empty strings and strings with whitespace more intuitively.

FILE="./test space.txt"

# file check is available, must with double quota
if [ -f "$FILE" ]; then
	echo "$FILE available"
else
	echo "$FILE not available"
fi

# file check is available without double quota
if [[ -f $FILE ]]; then
        echo "$FILE available"
else
        echo "$FILE not available"
fi

# 2. [[]] use && and || operators for boolean tests and < and > for string comparisons.
# [ cannot do this because it is a regular command and  &&, ||, <, and > are not passed to regular commands as command-line arguments.

# 3. It has a wonderful =~ operator for doing regular expression matches.
# see pattern matching in bash script
# result="abcd"
result=""
# here [[:alnum:]] means a signle alphanumeric character
# https://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html
# =~ which performs a regular expression match of the string to its left to the experssion pattern on its right
# The regular expressions understood by bash are the same as those that GNU grep understands with the -E flag
if [[ "$result" =~ [[:alnum:]] ]] ; then
	echo "result has valid character"
else
	echo "result empty"
fi

