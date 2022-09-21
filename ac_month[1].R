setwd('C:/Users/AI_10/Desktop/R test')
ac <- read.csv('month.csv', header = T)

ac_month <- aggregate(ac[,3:14], by=list(ac$사고정보),
                     FUN = mean)
colnames(ac_month) <- c('사고정보', '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월')

bs <- ac_month[2:13]
rownames(bs) <- c('부상자수', '사고건수', '사망자수')

par(mfrow = c(1, 2), mar = c(5,4.5, 4.5, 5))
barplot(as.matrix(bs[1:2,]), main = '월별 교통사고 통계(5년 평균)', 
        col = c('purple', 'yellow'), 
        beside = T,
        ylim = c(0, 1600),
        legend.text = T, 
        args.legend = list(x='topright' , bty = 'n', inset = c(-0.55, 0), cex = 0.55))

barplot(as.matrix(bs[3,]), main = '월별 교통사고 사망자 통계(5년 평균)',
        col = c('orange'),
        ylim = c(0, 16),
        beside = T)
