install.packages("faraway")
install.packages("dplyr")
install.packages("ggplot2")

library("faraway")
library("dplyr")
library("ggplot2")

data("worldcup")

worldcup_players <- worldcup %>%
  mutate(player = rownames(worldcup)) %>%
  filter(Shots == max(Shots) | Passes == max(Time)) %>%
  mutate(point_label = paste(player, Team, Position))

Gyan <- ggplot(worldcup, aes(x = Time, y = Shots)) +
  geom_point(alpha = 0.3)

Arrow <- Gyan +
  annotate("segment", x=400, xend=501, y=25, yend=27, size=1, colour="red",arrow=arrow())

Arrow2 <- Arrow +
  annotate("text", x=330, y=25, size = 3, colour='red', label = "Gyan(Ghana, Forward)")

