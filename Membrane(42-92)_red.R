library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "M.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[40:90,], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("Membrane Protein (42-92)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 20)) +
  
  geom_line(d = d[45:58, c(1,3)],aes(y = W55C_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 55, y = 1.185, color = "W55C"), size = 3) +
  
  geom_line(d = d[74:84, c(1,4)],aes(y = I82T_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 82, y = 0.993, color = "I82T"), size = 3) +
  
  geom_line(d = d[74:84, c(1,5)],aes(y = I82S_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 82, y = 1.008, color = "I82S"), size = 3) +
  
  
  scale_color_manual(name = "Mutations", values = c("W55C" = "dark cyan", "I82T" = "blue","I82S" = "maroon")) +
  theme(legend.position = c(-5,0.88), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
