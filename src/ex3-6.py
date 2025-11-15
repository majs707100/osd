import sys

print("-실행 파일 시작-")
for i, arg in enumerate(sys.argv[1:], 1):
    print(f"{i}번째 인자 : {arg}")
print("-실행 파일 끝-")
