#!/bin/bash

echo "-DB 폴더 확인 및  생성-"
mkdir -p DB

echo "-파일 생성 및 압축-"
cd DB
for i in {1..5}; do
    echo "${i}번째 파일" > "file_${i}.txt"
done

tar -czf DB_zip.tar.gz file_*.txt

cd ..

echo "-train 폴더 생성 및 파일 링크-"
mkdir -p train

for i in {1..5}; do
	file="DB/file_${i}.txt"
	link_file="train/link_file_${i}.txt"
	ln -sf "$file" "$link_file"
done


