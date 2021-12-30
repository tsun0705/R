# v1 변수에 1~5 입력
v1 = c(1,2,3,4,5)
v1

v1 = 1:5
v1

# v3에 1을 5번 반복해서 입력
v3 = rep(1,5)
v3

# v4에 1, 2를 5번 반복
v4 = rep(c(1,2),5)
v4

# v5에 1,3,5,7,9를 입력
v5 = seq(1,10,2)
v5

# v6에 2021-12-01 ~ 2021-12-10까지 대입
v6 = seq(as.Date('2021-12-01'), as.Date('2021-12-10'), 1)
v6

# 속성 확인
str(v1)

v7=c("A","B","C")
str(v7)   

v8=c("ABC")
str(v8)

# 형 변환
v1_chr = as.character(v1)
v1_chr
v1

# 문자 추출
t1 = c("a b c d")
substr(x=t1, start=1, stop=4) # 공백 포함

t1 = c("A","B","C")
t1[3]

#paste : 공백 후 추가, paste0 : 공백 없이 추가
paste0(t1, "FGH")
paste(t1, "FGH")

# 문자열 분리
strsplit(t1, " ")

# 요일로 나타냄
DAY =  as.factor(format(v6, "%a"))
DAY
summary(DAY)

DAY = factor(DAY, levels=c("월","화","수","목","금","토","일"))

# 이름 지정
names(t1)=c("A1","B1","C1")
t1

# 벡터의 계산
v1+1
v1*2
v1/2

v1 + c(123123,5,0,0,0) # 개수를 맞춰야함

# 랜덤 숫자 추출
sample(x = 1:6,
       size = 3,
       replace = F)

# 랜덤 숫자 고정
set.seed(1)
sample(x = 1:6,
       size = 3,
       replace = F)


#ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

# 행렬 생성
m = matrix(0, 2, 3)
m

m2 = matrix(1:20, 2)
m2

m3 = matrix(1:20, 4) # 설정 안할 시 열 우선
m3

m4 = matrix(1:20, 4, byrow=T) # 데이터를 행 우선 
m4

m2[2,] # m2 행렬의 2행 추출
m2[,2] # m2 행렬의 2열 추출

m5 = m3 + m4
m5

# 행렬 곱의 원칙 4행 4열 * 5행 3열 = 4행 3열  => %*% 
m6 = m3 * m4
m6

m8 = matrix(1:6, 2)
m8

m9 =matrix(10:15, , 2)
m9

# 2행 3열 * 3행 2열
m10 = m8 %*%  m9
m10

# 데이터 프레임
DF1 = data.frame(
  v1 = 1:3,
  v2 = c("A", "B", "C"),
  v3 = seq(4,6,length.out=3),
  v4 = rep(Sys.Date(),3)
)
DF1

# 데이터 프레임 구조 확인
str(DF1) # 속성
dim(DF1) # 행과 열 갯수
nrow(DF1) # 행 갯수
ncol(DF1) # 열 갯수

# 데이터 프레임 저장
write.csv(DF1, "./data/rdata.csv")
read.csv("./data/rdata.csv") # 데이터 프레임 불러오기

# 행, 열 이름 변경
DF1
rownames(DF1) = c("A","B","C")
colnames(DF1) = c("Number", "Alphabet", "Number2", "Date")

# 변수(필드) 추가
DF1$Alphabet2 = c("D","E","F")
DF1$Date2 = format(DF1$Date, "%A")
DF1

# 데이터 프레임 병합
DF2 = data.frame(
  A = c(1,2,3),
  B = c(4,5,6)
)

DF3 = data.frame(
  A = c(5,4,1),
  B = c(3,2,1)
)

rbind(DF2, DF3) # 덧셈이 아니라 데이터 합치기 / 행을 생성
cbind(DF2,DF3) # 열을 생성
