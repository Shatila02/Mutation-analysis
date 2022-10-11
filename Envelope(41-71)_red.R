library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "Envelope.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[39:69,], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("Envelope Small Membrane Protein (41-71)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 20)) +
  
  geom_line(d = d[53:63, c(1,3)],aes(y = R61L_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 61, y = 1.126, color = "R61L"), size = 3) +
  
  geom_line(d = d[62:70, c(1,4)],aes(y = P71L_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 71, y = 1.128, color = "S46L"), size = 3) +
  
  geom_line(d = d[50:60, c(1,5)],aes(y = V58F_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 58, y = 1.057, color = "V58F"), size = 3) +
  
  
  scale_color_manual(name = "Mutations", values = c("R61L" = "dark cyan", "P71L" = "blue","V58F" = "maroon")) +
  theme(legend.position = c(-5,0.9), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
