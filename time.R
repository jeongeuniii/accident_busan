setwd('C:\Users\AI_10\Desktop\R test(pc)')
ac <- read.csv('month.csv', header = T)
ac

accid <- aggregate(ac[,4:15], by=list(ac$사고정보),
                   FUN = mean)
accid
colnames(accid) <- c('사고정보', '0~2시', '2~4시', '4~6시', '6~8시', '8~10시', '10~12시', '12~14시', '14~16시', '16~18시', '18~20시', '20~22시', '22~24시')

ds <- accid[,2:13]
rownames(ds) <- c('부상자수', '사고건수', '사망자수')
ds

bs <- table(ds)
bs
par(mfrow = c(1, 1), mar = c(5, 5, 5, 7))
barplot(as.matrix(ds), main = '시간별 교통사고 통계(5년 평균)', 
        col = c('purple', 'yellow', 'orange'), 
        beside = T, 
        legend.text = T, 
        args.legend = list(x = 'topright', bty = 'o', inset = c(-0.2, 0)))

