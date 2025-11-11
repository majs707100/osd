#!/bin/sh

read num

for i in $num; do
	if [ $i -ge 90 ]; then	
		grade="A"
	else
		grade="B"
	fi
	echo "$grade : $i "
done
exit 0
