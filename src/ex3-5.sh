#!/bin/bash


run_command() {
	ls_func(){
        	command=$1
        	shift
        	eval "$command $@"
	}   
    	ls_func "ls" "$@"
}

echo "- ls -l 실행 -"
run_command -l

echo ""

echo "- ls -l -a 실행 -"
run_command -l -a
