#!/bin/bash

# return value from bash functions
# Bash functions, unlike functions in most programming languages do not allow 
# you to return a value to the caller.
# When a bash function ends its return value is its status: zero for success,
# non-zero for failure.
# there are 3 ways to return value:
# 1. set a global variable with the result
# 2. use command substitution
# 3. pass in the name of variable to use as the result variable

# 1. set a global variable with the result
function testfunc1()
{
	myresult="test1: set global variable example"
}

testfunc1
echo $myresult

# 2. use command substitution
function testfunc2()
{
	local myresult="test2: use command substitution"
	echo $myresult
}
# command substitue $(command)
result=$(testfunc2)
echo $result

# 3. pass variable as function parameter
function testfunc3()
{
	local __resultvar=$1
	local myresult="test3: pass variable as function parameter"
	eval $__resultvar="'$myresult'"
}

testfunc3 result
echo $result

# looks way 2 is the best to understand
