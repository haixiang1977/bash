#!/bin/bash

# iterate string whose delimiter is space
DNS_ENTRY="test_1.txt test_2.sh test_3.doc"

for file in $DNS_ENTRY; do
	# %pattern remove pattern from the right
	# remove file extention name
	name=${file%.*}
	echo $name
	# #pattern remove patter from the left
	ext=${file#*.}
	echo $ext
done

