install.packages("faraway")
install.packages("dplyr")

library("faraway")
library("dplyr")

data("worldcup")

worldcup %>%
  filter(Team %in% c("Spain", "Netherlands", "Germany", "Uruguay")) %>%
  ggplot(aes(x = Time, y = Shots)) +
  geom_point() +
  xlab("Time plyed(minutes)") + ylab("Shots(number)") +
  geom_vline(xintercept = 90 * 1:6, color = "blue",alpha = 0.5) +
  geom_hline(yintercept = 5 * 1:4, color = "blue",alpha = 0.5) +
  scale_x_continuous(breaks = seq(0, 540, 90)) +
  scale_y_continuous(breaks = seq(0, 25, 5)) +
  facet_grid(Team ~ Position)

