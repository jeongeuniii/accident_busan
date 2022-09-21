#네모 treemap
setwd('C:\\Users\\AI_14\\Documents\\R project\\')
area <- read.csv('area.csv', header = T)
ar <- area[2:18,]
ar

class(area[,2])
head(area)
treemap( ar,
        index = c('시도'),
        vSize = '합계',
        vColor = '합계',
        type = 'value',
        palette = heat.colors(nrow(ar)),
        title= "도시별 교통사고 통계"
        )

#https://mrkevinna.github.io/R-%EC%8B%9C%EA%B0%81%ED%99%94-4/
library(ggplot2)
korea <- map_data(map = 'world',
                  region = 'south korea')

head(korea)
koreamap <- ggplot(data = korea,
                   mapping = aes(x=long, y=lat, group=group))+
            geom_polygon(fill = 'white', color='black')
koreamap + coord_map()

#https://blog.naver.com/PostView.nhn?blogId=regenesis90&logNo=222223614921
install.packages('sf')

install.packages('tidyverse')
install.packages("ggmap")
install.packages("raster")
install.packages("rgeos")
install.packages("maptools")
install.packages("rgdal")

library(tidyverse)
library(sf)
library(mapproj)
library(sp)

map_korea <- st_read('C:/Users/AI_14/Documents/R project/CTPRVN_20220324/ctp_rvn.shp')

map_korea$CTPRVN_CD <- iconv(map_korea$CTPRVN_CD,
                             from = 'CP949',
                             to = 'UTF-8',
                             sub = NA,
                             mark = TRUE,
                             toRaw = FALSE)


map_korea_shp <- as(map_korea, 'Spatial')

map_korea_df <- fortify(map_korea_shp)

str(map_korea_df)
head(map_korea_df)

map_korea_ggplot <- map_korea_df %>%
  ggplot(aes(x=long, y=lat, group= group))  

map_korea_ggplot+ geom_polygon(fill='white', color='black')+
  coord_quickmap()

