install.packages("ggmap")
install.packages("readxl")
install.packages("dplyr")
install.packages("stringr")
install.packages("sf")
library("dplyr")
library("readxl")
library("ggmap")
library("stringr")
library("readr")


# 1.
PM25 <- read_excel("dustDetailInfo.xls",
                   sheet = 1,
                   range = cell_rows(4:44),
                   col_names = T)

# 2.
sigungu_df %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_path(color = "black")

View(sigungu_shp_spatial)

sigungu_shp_spatial@data$id <- rownames(x = sigungu_shp_spatial@data)
View(sigungu_shp_spatial@data)

sigungu_df_all <- left_join(sigungu_df, sigungu_shp_spatial@data, by = "id")
View(sigungu_df_all)

sigungu_df_all %>%
  filter(str_detect(SIG_CD, "^11")) %>%
  ggplot(aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "skyblue", color = "white") +
theme_void()

PM25$측정소명 <- PM25$측정소명 %>%
  str_replace_all("\\[.+\\]", "")

head(sigungu_df_all)

Seoul <- sigungu_df_all %>%
  filter(str_detect(SIG_CD, "^11"))

head(Seoul)
head(PM25)

PM25_Seoul <- PM25 %>%
  right_join(Seoul, by = c("측정소명" = "SIG_KOR_NM"))