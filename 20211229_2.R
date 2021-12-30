mpg = as.data.frame(ggplot2::mpg)

library(dplyr)

mpg_diff = mpg %>% select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

head(mpg_diff)

table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)

# 일반 휘발유와 고급 휘발유를 사용했을때 차이가 있는지 t-검정으로 확인
mpg_diff2 = mpg %>% select(fl, cty) %>% 
  filter(fl %in% c("r", "p")) # r: regular, p: premium

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)
