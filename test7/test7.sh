# If the first character of PARAMETER is an exclamation point, Bash uses the 
# value of the variable formed from the rest of PARAMETER as the name of the 
# variable; this variable is then expanded and that value is used in the rest 
# of the substitution, rather than the value of PARAMETER itself. This is 
# known as indirect expansion.

test="yes"

TEST="test"

echo "TEST direct expansion $TEST"

echo "TEST in-direct expanstion ${!TEST}"

