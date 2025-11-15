#!/bin/bash

declare -A grade

add(){
	read -p "과목: " subject
	read -p "성적: " score
	grade["$subject"]=$score
}

show(){
	echo "-점수-"
	for i in ${!grade[@]}; do
		echo "$i : ${grade["$i"]}"
	done
}

mean(){
	sum=0
	count=0
	
	for i in ${grade[@]}; do
		sum=$(expr "$sum" + "$i")
		count=$(expr "$count" + 1)
	done
	
	echo "$sum / $count" | bc -l
}

gpa(){
	m=$(mean)
	result=0

	if [ "$(echo "$m >= 90" | bc)" -eq 1 ]; then
        	result=4.0
    
   	elif [ "$(echo "$m >= 80" | bc)" -eq 1 ]; then
        	result=3.0
    
    	elif [ "$(echo "$m >= 70" | bc)" -eq 1 ]; then
        	result=2.0
        
    	elif [ "$(echo "$m >= 60" | bc)" -eq 1 ]; then
        	result=1.0
        
    	else
        	result=0.0
    	fi
    
    	echo "-GPA 점수-"
    	echo "$result"
}

while :
do
	echo "==================="
	echo "1) 과목성적추가"
	echo "2) 입력된모든점수보기"
	echo "3) 평균점수확인"
	echo "4) 평균등급(GPA) 변환"
	echo "5) 종료"
	echo "==================="

	read num	

	case $num in
		1) add ;;
		2) show ;;
		3) mean ;;
		4) gpa ;;
		5) break ;;
	esac
done

