install.packages("faraway")
install.packages("magrittr")
install.packages("dplyr")
install.packages("tidyverse")

library("faraway")
library("dplyr")
library("magrittr")
library("tidyverse")

data("worldcup")

View(worldcup)

worldcup_summary <- worldcup %>%
  select(Team) %>%
  mutate(Mean_time = mean(Time),
         Mean_Shots = mean(Shots),
         Mean_Passes = mean(Passes),
         Mean_Tackles = mean(Tackles),
         Mean_Saves = mean(Saves))


