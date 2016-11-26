#!/bin/bash

# this test will check the configure file with new settings and update
# bash -x ./test6.sh for debug
# bash -xv ./test6.sh for debug and source code viewer

# generate configure.default
if [ ! -f ./configure.default ]; then
    echo "X_123_ENABLED=YES" > ./configure.default
    echo "ABC_ENABLED=YES" >> ./configure.default
fi

# generate new configure file
if [ ! -f ./configure.new ]; then
    echo "X_123_ENABLED=NO" > ./configure.new
    echo "ABC_ENABLED=NO" >> ./configure.new
    echo "LHX_DEBUG_ENABLED=YES" >> ./configure.new
    echo "&BAD_CONFIGURE_ENABLED=YES" >> ./configure.new
fi

# generate a configure template from .default
cp configure.default configure

# read all configuration from configure.new with pattern match
# ^ matching the following regular expression at the beginning of the line
# [] match any one of the enclosed characters. A '-' include a range.
# grep: -e pattern Use  PATTERN  as  the  pattern.
#       -x Select  only  those  matches  that exactly match the whole line.

# rules here: start with number, alphabet and have '=' in the middle
new_settings=`grep -x -e '^[0-9_A-Za-z]*=[A-Za-z]*' configure.new`
# echo $new_settings
# 123_ENABLED=NO ABC_ENABLED=NO LHX_DEBUG_ENABLED=YES
# and &BAD_CONFIGURE_ENABLED=YES removed

# put all settings from configure into variable
. ./configure

# use declare to check the value of variable
# declare -p (or bash -xv ./test6.sh )

# update the settings in configure with the one in configure.new only
# loop new_settings and compare ./configure variable
for key_value in $new_settings; do
    # pattern match
    # key is the left side of key_value before '='
    # ${var##pattern} use value of var after removing the patter from the left
    # ${var%%pattern} use value of var after removing the patter from the right
    key=${key_value%%=*}
    value=${key_value##*=}
    # take key as aliase since variabe already read from . ./configure
    #echo ${!key}
    if [ "$value" != "${!key}" ]; then
        # echo $key $value ${!key}
        sed_script+=" -e s/^${key}=.*/$key_value/"
        # update value in variable with new value
        eval $key_value
    fi
done

tr="`sed $sed_script ./configure`"
# write into file
`echo "$tr" > ./configure`
# result ============================
# tr="`sed $sed_script ./configure`"
# sed $sed_script ./configure
# ++ sed -e 's/^X_123_ENABLED=.*/X_123_ENABLED=NO/' -e 's/^ABC_ENABLED=.*/ABC_ENABLED=NO/' -e 's/^LHX_DEBUG_ENABLED=.*/ LHX_DEBUG_ENABLED=YES/' ./configure
# + tr='X_123_ENABLED=NO
# ABC_ENABLED=NO'
# write into file
# `echo "$tr" > ./configure`
# echo "$tr" > ./configure
# ++ echo 'X_123_ENABLED=NO
# ABC_ENABLED=NO'
# ===================================


