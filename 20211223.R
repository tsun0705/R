library(ggplot2)
install.packages(ggplot2)
mpg$total = (mpg$cty+mpg$hwy)/2
head(mpg)
qplot(mpg$test)
#total이 30이상이면 A, 20~29는 B 20 미만이면 C 등급으로 분류
mpg$grade = ifelse(mpg$total >=30 "A",
                   ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)
table(mpg$grade)

library(dplyr)

install.packages("dplyr")

exam = read.csv("cwsv_")

# exam에서 class가 1인 경우만 출력
exam %>%  # Ctrl + Shift + M
  
exam %>%  filter(english< 90 | science<50)
exam %>%  filter(class == 1 | class == 3 | class == 5)

# 수학만 제외
exam %>% select(-math)

# 행과 열의 조합
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class==1) %>%  select(english)

# 수학 점수 순서대로 정렬
exam %>% arrange(math)

# 높은 점수 순서대로 정렬
exam %>% arrange(desc(math))

# 1순위 반, 2순위 수학
exam %>% arrange(class, math)

# 파생 변수 추가
exam %>% mutate(total = math + english + science) %>% head


exam %>% mutate(total = math + english + science, mean = (math + english + science)/3 %>% head

exam %>% mutate(test = ifelse(science>=60, "pass", "fail")) %>% head

exam %>% mutate(total = math + english + science) %>% arrange(total) %>% head

# 집단별 요약
exam %>% summarise(mean_math = mean(math)) # 수학 평균 산출

# 반별로 수학 평균 산출
exam %>% group_by(class) %>% summarise(mean_math = mean(math)) 


mpg %>% group_by(manufacturerm) 

# 중간고사 기말고사 데이터 생성
test1 = data.frame(id=c(1,2,3,4,5), midterm = c(60,80,70,90,85))
test2 = data.frame(id=c(1,2,3,4,5), final = c(60,80,70,90,85))

# 중간고사 + 기말고사
total = left_join(test1, test2, by="id")
total
