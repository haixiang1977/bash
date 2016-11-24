#!/bin/bash

# 3 ways to executae command in shell
# eval "command"
# `command`
# $(command)

COMMAND="ls -l"

echo "COMMAND $COMMAND"

echo "eval $COMMAND"
eval $COMMAND

echo '`$COMMAND`'
result=`$COMMAND`
echo $result

echo '$($COMMAND)'
echo $($COMMAND)

