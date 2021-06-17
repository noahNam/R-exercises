install.packages("ggmap")
install.packages("readxl")
library("readxl")
library("ggmap")

register_google(key = "AIzaSyBMgqAOhTeynYBWImT55lND4H7mZO8pzeE")

# 1.
station_list <- read_excel("station_list.xls",
                                 sheet = 1,
                                 range = cell_rows(4:29),
                                 col_names = T)


# 2.
Seoul_station_gc <- station_list$'측정소 주소' %>%
  enc2utf8() %>%
  geocode()

Seoul_station_list_lonlat <- station_list %>%
  mutate(Seoul_station_gc)

# 3.
cen <- c(mean(Seoul_station_list_lonlat$lon),mean(Seoul_station_list_lonlat$lat))

lapply(Seoul_station_gc, as.numeric)

map <- get_googlemap(center = cen,
              zoom = 11,
              maptype = "roadmap",
              marker = Seoul_station_gc)%>%
  ggmap(extent = "device")

map + geom_text(data= Seoul_station_list_lonlat,
               aes(x= lon, y= lat),
               size= 3,
               label= Seoul_station_list_lonlat$'측정소명')
