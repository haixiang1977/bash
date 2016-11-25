#!/bin/bash

# read filelist from backup directory
# then copy from ./tmp/ to ./restore/

# check ./backup ./tmp and ./restore directory available or not
if [ ! -d ./tmp ]; then
    mkdir -p ./tmp
    mkdir -p ./tmp/a
    mkdir -p ./tmp/b
    echo "hello a" > ./tmp/a/a.txt
    echo "hello b" > ./tmp/b/b.txt
fi

if [ ! -d ./restore ]; then
    mkdir -p ./restore
fi

if [ ! -d ./backup ]; then
    mkdir -p ./backup
fi

# general backfilelist at ./backup directory
echo "./a/a.txt" > ./backup/backfilelist
echo "./b/b.txt" > ./backup/backfilelist

