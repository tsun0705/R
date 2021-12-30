getwd() # 현재 디렉토리 확인
source("20211228.R") # R 스크립트 불러오기, 함수 이용 가능
setwd("..")
setwd("./r_data") #디렉토리 설정

a = getwd()
a
q() # R 스튜디오 종료

save.image() # 작업 공간 전체 저장

ls() # 작업 공간에 저장된 내용 확인

x = 100
y = c(2,3,5,7) # 벡터 형식의 데이터 함수를 생성
f = function(y) (y-32)/1.8 # 함수를 생성
hero = c("Superman", "Betman", "Spiderman")
ls()
ls.str() # 구체적인 내용 확인

z = 3.14
z
rm(z) # 변수 제거
rm(x, y, a) # 변수 여러개 제거 

ls()

rm(list=ls()) # 모든 변수 제거

save(hero, file="hero.rda") # hero 변수를 hero.rda로 저장
rm(hero)

load("hero.rda") # hero.rda 불러오기
hero

history() # 실행했던 명령어 확인
