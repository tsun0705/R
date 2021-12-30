library() # 패키지 리스트 출력
installed.packages() # 설치된 패키지 출력
colnames(installed.packages()) # 컬럼명만 출력

installed.packages()[, c("Package", "Version")] # 패키지명, 버전만 출력
# , 를 기준으로 앞은 행 뒤는 열 행은 공백이므로 모든 행 출력

search() # 현재 메모리에 적재된 리스트

m = matrix(1:6, 3, 2) # 1~6까지 3행 2열의 행렬을 출력
m

t(m) # 행과 열을 바꿔서 출력 / 전치행렬

t = function(x) x+100

t(m) # search 경로 상에 있는 첫 번째 .GlobalEnv 안에 사용자가 생성한 t함수를 실행

base::t(m) # base 패키지의 t 함수 실행

# 라이브러리로 패키지를 적용해야 패키지 내 함수 사용 가능
library(lattice)
xyplot(dist ~ speed, data=cars) # 산점도 그래프
detach(package:lattice) # 패키지 적용 해제 

install.packages("ggplot2") # 고급 그래픽 생성할 때 사용하는 패키지
.libPaths() # 패키지가 설치된 경로

#ㅡㅡㅡㅡ패키지에 대한 설명ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
help(package="ggplot2") 
library(help=ggplot2)
help(ggplot2)
help(cars)

library(ggplot2)
ls("package:ggplot2") # 패키지의 함수 출력
#ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

data() # 데이터셋 확인
head(cars) # cars의 처음 6개의 행 데이터 확인
tail(cars) # cars의 마지막 6개의 행 데이터 확인
head(cars, 10) # 10개 씩
tail(cars, 10) # 10개 씩
cars # 전체 데이터


data(package="MASS") # MASS 패키지에 포함된 데이터 확인
data(Animals, package = "MASS") # MASS 패키지 내 Animals 데이터셋 불러오기
head(Animals, 10) # Animals 데이터 확인
# MASS를 메모리에 적재하면 head 를 사용하여 바로 확인 가능
library(MASS)
head(UScrime)
