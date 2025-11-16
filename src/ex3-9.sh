#!/bin/bash

add_member(){
	echo "-팀원 정보 추가-"
	read -p "이름: " name
    	read -p "생일 (YYYY-MM-DD): " birth
    	read -p "전화번호: " phone

	echo "M|$name|$birth|$phone" >> "$DB"

}

add_activity(){
    	echo "-팀원과 한 일 기록-"
    	read -p "활동 날짜 (YYYY-MM-DD): " date
    	read -p "팀원 이름: " name
    	read -p "활동 내용: " content

    	echo "A|$date|$name|$content" >> "$DB"
}

search_member(){
	echo "-팀원 정보 검색 (이름)-"
    	read -p "검색할 팀원 이름: " name

    	grep -i "^M|$name" "$DB"
    
    	if [ $? -ne 0 ]; then
        	echo "검색된 팀원이 없습니다."
    	fi
}

search_activity(){
    	echo "-수행 내용 검색 (날짜)-"
    	read -p "검색할 날짜 (YYYY-MM-DD): " date

    	grep "^A|$date" "$DB"
    
    	if [ $? -ne 0 ]; then
        	echo "검색된 날짜가 없습니다."
    	fi
}

DB="DB/DB.txt"

touch "$DB"

while :
do
	echo "======================"
    	echo "1) 팀원 정보 추가"
    	echo "2) 팀원과 한 일 기록"
    	echo "3) 팀원 검색"
    	echo "4) 수행 내용 검색"
    	echo "5) 종료"
    	echo "======================"
	
	read num

	case $num in
		1) add_member ;;
		2) add_activity ;;
		3) search_member ;;
		4) search_activity ;;
		5) break ;;
	esac
done
