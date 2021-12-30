economics = as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce )

head(mtcars)

car_cor = cor(mtcars)
round(car_cor,2)

install.packages("corrplot")
library(corrplot)

# 양수이면 블루, 음수이면 레드
corrplot(car_cor)

# 수치로 표시
corrplot(car_cor, method ="number")

# 수치와 색으로 표시
col = colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_cor,
         method="color", # 색으로 표현
         col=col(200), # 색상 200개 선정
         type="lower", # 왼쪽 아래 행렬만 표시
         order="hclust", # 유사한 상관계수끼리 군집화
         addCoef.col="black", # 상관계수 색깔
         tl.col="black", # 변수명 색깔
         tl.srt=45, # 변수명 45도 기울임
         diag=F) # 대각 행렬 제외외
                       