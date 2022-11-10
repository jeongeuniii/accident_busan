setwd('C:/Users/gjwls/OneDrive/바탕 화면/대학 자료/R 프로젝트/project')
area <- read.csv('area.csv', header = T)
area <- area[2:18, ]

install.packages('treemap')
library(treemap)

#대한민국 지도

install.packages('sf')
library(tidyverse)
install.packages('tidyverse')
library(tidyverse)

library(sf)
library(mapproj)

map_korea <- st_read('ctp_rvn.shp')
map_korea$CTPRVN_CD <- iconv(map_korea$CTPRVN_CD,
                             from = 'CP949',
                             to = 'UTF-8',
                             sub = NA,
                             mark = TRUE,
                             toRaw = FALSE)
install.packages("sp")
library(sp)

korea <- st_read('ctp_rvn.shp')
area[,1] <- c('Seoul', 'Busan', 'Daegu', 'Incheon', 'Gwangju', 'Daejeon', 'Ulsan', 'Sejong-si', 'Gyeonggi-do', 'Gangwon-do',"Chungcheongbuk-do","Chungcheongnam-do","Jeollabuk-do","Jellanam-do","Gyeongsangbuk-do","Gyeongsangnam-do","Jeju-do")
head(korea)
korea1 <- merge(korea, area, by = 'CTP_ENG_NM')
map_korea_df

ggplot() + geom_polygon(data = korea, 
                        aes(x = long, y = lat, group = group), fill = 'white', color = 'black')
map_korea_ggplot+
  geom_polygon(aes(fill = id, 'color' = 'black', show.legend = FALSE)+
                 scale_fill_nore('lumina')+coord_quickmap()+theme_minimal())

#데이터 시각화

install.packages('ggmap')
library(ggmap)
install.packages('raster')
library(raster)
install.packages('rgeos')
library(rgeos)
install.packages('maptools')
library(maptools)
install.packages('rgdal')
library(rgdal)


