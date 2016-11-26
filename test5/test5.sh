#!/bin/bash

# Test bash fifo to read and write from 2 different bash
# test with another commandline echo "xxxx" > ./testpipe

# create a fifo if not available

pipe=./testpipe

# check pipe available
if [ ! -p $pipe ]; then
    mkfifo ./testpipe
fi

# start to read data from pipe
# bash read: http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html
# read line from user input or file
while true;
do
    # read data from pipe then echo
    if read < $pipe; then
        echo $REPLY
        if [ "$REPLY" == "quit world" ]; then
            break;
        fi
    fi
done

