#워드 클라우드
setwd('C:/Users/AI_10/desktop/R test/Teamproject')
area <- read.csv('area.csv')
ar <- area[2:18,]

library(tidyverse)
library(wordcloud2)

wordcloud2(ar)
