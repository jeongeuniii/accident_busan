setwd('C:/Users/gjwls/OneDrive/바탕 화면/대학 자료/R 프로젝트')
ag <- read.csv('age.csv', header = T)
ag

ag <- aggregate(ag[,2:10], by = list(ag$사고정보), FUN = mean)

colnames(ag) <- c('사고정보', '12세이하', '13~20세', '21~30세', '31~40세', '41~50세', '51~60세', '61~64세', '65~70세', '71세이상')
age <- ag[,2:10]
age

rownames(age) <- c('부상자수', '사망자수')
summary(age)
t(age)

par(mfrow = c(1, 2))
barplot(as.matrix(age[1,]), main = '나이별 부상자 통계(5년 평균)',
        ylab = '부상자수',
        col = c('lightblue'))




barplot(as.matrix(age[2,]), main = '나이별 사망자 통계(5년 평균)',
        col = c('Medium Purple 1'),
        ylab = '사망자수')
