#!/bin/bash

# read filelist from backup directory
# then copy from ./tmp/ to ./restore/ according to the backupfilelist
# in ./backup/

# check ./backup ./tmp and ./restore directory available or not
if [ ! -d ./tmp ]; then
    mkdir -p ./tmp
    mkdir -p ./tmp/a
    mkdir -p ./tmp/b
    echo "hello a" > ./tmp/a/a.txt
    echo "hello b" > ./tmp/b/b.txt
fi

srcdir="./tmp/"

if [ ! -d ./restore ]; then
    mkdir -p ./restore
fi

dstdir="./restore/"

if [ ! -d ./backup ]; then
    mkdir -p ./backup
    mkdir -p ./backup/a
    mkdir -p ./backup/b
fi

# general backupfilelist at ./backup directory
echo "./a/a.txt" > ./backup/a/backupfilelist
echo "./b/b.txt" > ./backup/b/backupfilelist

# function to get all ./backup/ directory
function get_backupfile_dir {
    local dirs=""
    # loop the directory and return all
    for d in ./backup/*; do
        if [ -d "$d" ]; then
            dirs="$d $dirs"
        fi
    done
    # later $dirs will be used by function caller with `get_backupfile_dir`
    echo "$dirs"
}

# function to get all contents in backfilelists
function get_backup_files {
    for d in `get_backupfile_dir`; do
        if [ -f $d/backupfilelist ]; then
            # $(command) command substitution
            # take backuofilelist as input to echo, the caller will use it
            echo "$(< $d/backupfilelist)"
        fi
    done
}

# start to backup now ...
for entry in `get_backup_files`; do
    # create restore directory
    dir=`dirname $entry`
    mkdir -p $dstdir/$dir
    
    # check src directory backup file available or not
    if [ ! -f $srcdir$entry ]; then
        echo "$srcdir$entry file not found!!!"
    else
        # copy file from src directory to restore directory
        cp $srcdir$entry $dstdir$dir
    fi
done
        
    

