install.packages("mapproj")
install.packages("ggiraphExtra")
library("ggiraphExtra")

# 미국 주별 범죄 데이터 1973년 주별 강력 범죄율 정보
str(USArrests) # 속성 확인

head(USArrests) # 앞 부분 내용 확인인

library(tibble) # 형/열 변환용 라이브러리 -> dplyr

crime = rownames_to_column(USArrests, var = "state")
crime$state = tolower(crime$state) # 주, 글자를 모두 소문자로 변환환

str(crime)

install.packages("maps")
library(ggplot2) # map_data 함수 포함
states_map = map_data("state")

ggChoropleth(data = crime, # 지도에 표현할 데이터
       aes(fill = Murder, map_id = state), # 색으로 표현할 변수, 지역 기준 변수
         map = states_map) # 지도 데이터
          

# 인터렉티브 단계 구분
ggChoropleth(data = crime, # 지도에 표현할 데이터
       aes(fill = Murder, map_id = state), # 색으로 표현할 변수, 지역 기준 변수
       map = states_map, # 지도 데이터
       interactive = T) # 인터렉티브

#ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
# 대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기
install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)
str(changeCode(korpop1)) # 한글 깨짐 방지

# 변수명이 한글로 돼있으면 오류가 발생할 수 있어 영문으로 변경
library(dplyr)
korpop1 = rename(korpop1, pop = 총인구_명, name = 행정구역별_읍면동)
korpop1$name = iconv(korpop1$name, "UTF-8", "CP949")
korpop1$name
str(changeCode(kormap1))

# 인구밀도
ggChoropleth(data = korpop1, 
             aes(fill = pop, map_id = code, 
                 tooltip = name), # 지도 위에 표시할 지역명 
             map = kormap1, 
             interactive = T) 


# 한국 지도
# korpop1 - 2015년 센서스 데이터(시도별)
# korpop2 - 2015년 센서스 데이터(시군구별)
# korpop3 - 2015년 센서스 데이터(읍면동별)  
# changeCode - 인코딩을 CP949 (euc_kr)로 변환하여 한글이 보여지도록 함

# 결핵환자수
str(changeCode(tbc))
tbc$name = iconv(tbc$name, "UTF-8", "CP949")

ggChoropleth(data = tbc, 
             aes(fill = NewPts, map_id = code, 
                 tooltip = name),
             map = kormap1, 
             interactive = T) 
