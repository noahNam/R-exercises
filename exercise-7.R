# Title     : TODO
# Objective : TODO
# Created by: noah
# Created on: 2021/06/21

install.packages('faraway')
install.packages("ggplot2")

library(faraway)
library(ggplot2)
data(nepali)

nepali <- nepali %>%
  select(id, sex, wt, ht, age) %>%
  mutate(id = factor(id),
         sex = factor(sex, levels = c(1, 2),
                      labels = c("male", "female"))) %>%
  distinct(id, .keep_all = TRUE);


ggplot(nepali, aes(x = ht)) + geom_histogram();