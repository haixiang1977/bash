#!/bin/bash

# understanding case with number and string

function check_error {
    echo "error code $1"
    case $1 in
        [0])
            echo "no error"
            ;;
        [1-3])
            echo "error in file format detected"
            ;;
        [4-7])
            echo "no memory"
            ;;
        [9]*)
            echo "the specified file were not found."
            ;;
        *)
            echo "error error code $1"
            ;;
    esac
}

function check_condition {
    echo "condition $1"
    case $1 in
        start)
            echo "start now"
            ;;
        stop)
            echo "stop now"
            ;;
        *)
            echo "unknow condtion now"
            ;;
        esac
}

check_error 1

check_error 9

check_error 99

check_condition start

check_condition stop

check_condition default


