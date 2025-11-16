#!/bin/bash

user_info(){
	echo "-사용자 정보-"
	who
}

gpu_cpu(){
	echo "-GPU_CPU 사용률-"
	if command -v nvidia-smi &> /dev/null; then
        	nvidia-smi --query-gpu=utilization.gpu,memory.used --format=csv,noheader
    	else
        	top -bn1 | head -n 5 
    	fi
}

memory(){
	echo "-메모리 사용량-"
	free -h
}

disk(){
	echo "-디스크 사용량-"
	df -h
}

while :
do 
	echo "-------------------------"
	echo "1) 사용자정보"
	echo "2) GPU 또는 CPU 사용률확인"
     	echo "3) 메모리사용량확인"
	echo "4) 디스크사용량확인"
	echo "5) 종료"
	echo "-------------------------"
	read num

	case $num in
		1) user_info ;;
		2) gpu_cpu ;;
		3) memory ;;
		4) disk ;;
		5) break ;;
	esac
done
