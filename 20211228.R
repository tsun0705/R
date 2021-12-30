#install.packages("rJava")
#install.packages("memoise")
#install.packages("remotes")
#remotes::install_github('haven-jeon/KoNLP',upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)

txt = "문장에 대한 이해가 필요하다."
extractNoun(txt)
#------------------------------>KoNLP 설치 테스트 완료

#데이터 불러오기
 txt = readLines("./data/hiphop.txt")
 head(txt)
 
#install.packages("Stringr")
 library(stringr)
txt = str_replace_all(txt, "\\W", " ")

#가사에서 명사 추출
nouns = extractNoun(txt)

#추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount = table(unlist(nouns))

#데이터 프레임으로 변환
df_word = as.data.frame(wordcount, stringsAsFactors=F)

library(dplyr)

#변수명 수정
df_word = rename(df_word,  word=Var1, freq=Freq)

#두 글자 이상 단어 추출
df_word = filter(df_word, nchar(word) >= 2)

# 상위 20개 글자 목록 확인
top_20 = df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

top_20
#------------------> 워드 카운터 완료

# 워드 클라우드 만들기
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

# Dark2 색상 목록에서 8개 색상 추출
pal = brewer.pal(8, "Dark2")

set.seed(1234) # 랜덤 고정

wordcloud(words = df_word$word, # 단어 
          freq = df_word$freq, # 빈도
          min.freq = 2, # 최소 단어 빈도
          max.words = 200, # 최대 단어 갯수
            random.order = F,  # 고빈도 단어 중앙 배치
          rot.per = .1,  # 회전 단어 비율
          scale = c(4, 0.3), # 단어 크기 범위
          colors = pal) # 색상 목록
 
 
 
 
 
 
 
 