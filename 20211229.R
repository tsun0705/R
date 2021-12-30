# 인터렉티브 그래프 : 마우스 움직임에 반응하여 실시간으로 

install.packages("plotly")
library(plotly)
 
# x축에 displ(배기량), y축에 고속도로 hwy(연비)
# 산점도의 점을 drv(구동 방식)별로 다른 색으로 표현
library(ggplot2)
p=ggplot(data=mpg, aes(x=displ, y=hwy, col=drv))+geom_point()

ggplotly(p)

#diamonds는 다이아몬드 5만여 개의 캐럿, 컷팅 방식, 가격 등의 속성을 담은 데이터
p=ggplot(data=diamonds, aes(x=cut, fill=clarity))+geom_bar(position="dodge")
ggplotly(p)

# 인터렉티브 시계열 그래프 만들기
# economics는 실업자 수, 저축률 등 1967~2015년 미국의 월별 경제 지표
install.packages("dygraphs")
library(dygraphs)

economics = ggplot2::economics
head(economics)
dim(economics) # 행/열 갯수 추출

# xts()를 사용하여 economics 데이터의 unemploy(실업자 수)를 xts타입으로 변경
library(xts)
eco = xts(economics$unemploy, order.by = economics$date)
head(eco)

dygraph(eco)

# 날짜 범위 선택 기능
dygraph(eco) %>% dyRangeSelector()

# 저축률
eco_a = xts(economics$psavert, order.by = economics$date)

# 실업자 수
eco_b = xts(economics$unemploy/1000, order.by = economics$date)

eco2 = cbind(eco_a, eco_b) # 데이터 결합
colnames(eco2) = c("psavert", "unemploy") # 변수명 변경
head(eco2)

dygraph(eco2) %>% dyRangeSelector()
