# 데이터 입력
df = data.frame(sex = c("M", "F", NA, "M", "F"),
                score = c(5, 4, 3, 4, NA))

df

# 결측치 확인
is.na(df)

table(is.na(df))

# 각 필드에 대한 결측치 확인
table(is.na(df$sex))

table(is.na(df$score))

# 결측치가 있는 경우 계산이 되지 않음
mean(df$sex)
mean(df$score)

# 결측치 제거
library(dplyr)
df %>% filter(is.na(score)) # score가 NA인 데이터만 출력

df %>% filter(!is.na(score)) # score 결측치 제외한 데이터 출력

df_nomiss = df %>% filter(!is.na(score)) # df_nomiss에 score 결측치 제외한 데이터 출력을 저장
df_nomiss

sum(df_nomiss$score)

# 여러 필드에 대해 결측치 없는 데이터만 추출
df_nomiss = df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

# 결측치가 하나라도 있으면 제거하는 함수 - omit()
df_nomiss2 = na.omit(df) # 모든 필드에 결측치를 제거
df_nomiss2

# 결측치를 제거하는 것이 아니라 제외하고 계산 - na.rm = T
sum(df$score, na.rm=T)

exam = read.csv("./data/csv_exam.csv")
exam
exam[c(3, 8, 15), "math"] = NA #3, 8, 15행의 math에 NA를 할당

exam %>% summarise(mean_math = mean(math, na.rm = T)) # 결측치를 제외하고 계산

#ifelse() 함수를 사용하여 NA값을 평균값으로 대체하여 계산
exam$math = ifelse(is.na(exam$math), 55, exam$math) # NA를 평균값인 55로 대체
table(is.na(exam$math)) # 결측치 확인

# 이상치 만들기
outlier = data.frame(sex = c(1,2,1,3,2,1), score=c(5,4,3,4,2,6))

outlier

table(outlier$sex)

# 이상치가 발견되면 결측치로 변경
outlier$sex = ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

outlier$score = ifelse(outlier$score > 5, NA, outlier$score)
outlier

# 결측치를 제외하고 성별로 score의 평균을 구함
outlier %>% filter(!is.na(sex) & !is.na(score)) %>% group_by(sex) %>% summarise(mean_score=mean(score))

boxplot(mpg$hwy)

boxplot(mpg$hwy)$stats # 상자 그림을 통계치 출력

# 12~37 벗어나면 NA 할당
mpg$hwy = ifelse(mpg$hwy <12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

# 결측치를 제외하고 데이터 분석
mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy, na.rm=T))


# 1단계 - x축은 displ, y축은 hwy로 지정해 배경 설정
ggplot(data=mpg, aes(x=displ, y=hwy))

# 2단계 - 배경에 산점도 추가
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()

# 3단계 - x축 범위 3~6으로 지정, y축 범위는 10~30으로 지정
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point() + xlim(3,6) + ylim(10,30)


library(dplyr)

rm(mpg)

df_mpg = mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy)) 
df_mpg

ggplot(data=df_mpg, aes(x=drv, y=mean_hwy))+geom_col()
ggplot(data=df_mpg, aes(x=reorder(drv, -mean_hwy), y=mean_hwy))+geom_col()

# 빈도 막대 그래프
# x축만 지정하고, geom_col 대신에 geom_bar() 사용
ggplot(data=mpg, aes(x=drv)) + geom_bar()

ggplot(data=mpg, aes(x=hwy)) + geom_bar()

## 시계열 그래프 - 선 그래프
ggplot(data = economics, aes(x=date, y=unemploy)) + geom_line()

## 상자 그래프
ggplot(data = mpg, aes(x=drv, y=hwy)) + geom_boxplot()
