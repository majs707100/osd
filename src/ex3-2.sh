#!/bin/sh
read num

for i in $num; do
	echo "($i * $i) /2" | bc -l
done
