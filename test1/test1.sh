#!/bin/bash

# to exercise the parameter cascade
# to exericse getopts from command line
# to exercise the shell function usage
# to exercise parameter position
# command to use zip to compress the source file
# ./test1.sh -p password -f test.zip test.txt

# in bash, . ./xxx.sh is the same as source xxx.sh (which run in current shell)
# the difference between source xxx.sh and ./xxx.sh is:
# source xxx.sh run in current shell and affects the current shell environment
# ./xxx.sh will run in sub shell and not affect the current shell environment
. ./zipfile.sh

# in function, $0 is the function name, $1 is the 1st argument, $2 is the 2nd
function usage() {
    echo "Usage: $0 [-p password] [-f test.zip] test.txt"
    echo ""
    echo "where:"
    echo "     -p password: password to zip [dafaults to ""]"
    echo "     -f test.zip: path to the backup.zip [defaults to ""]"
    echo ""
}

password=""
zipfile=""
srcfile=""

while getopts ":p:f:" opt; do
    case $opt in
        p)
            password=$OPTARG
            ;;
        f)
            zipfile=$OPTARG
            ;;
        *)
            usage;
            exit 1;
            ;;
    esac
done;

# get the number of argument
numArgs="$#"

# get last argument
# ${*} means all arguments
# ${var:pos} means from pos to end
echo "'$*' $*"
echo "'$@' $@"

srcfile=${*:$numArgs}

echo "zipfile: $zipfile password: $password srcfile: $srcfile"

#zip_file defined in zip_file.sh
zipfile $zipfile $password $srcfile

