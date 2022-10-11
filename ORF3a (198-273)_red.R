library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF3a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[198:273,], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF3a (200-275)") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  
  geom_line(d = d[216:227, c(1,17)], aes(y = V225F_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,17)], aes(x= 225, y = 1.011, color = "V225F"), size = 3) +
  
  geom_line(d = d[228:237, c(1,18)],aes(y = K235T_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,18)], aes(x= 235, y = 1.057, color = "K235T"), size = 3) +
  
  geom_line(d = d[265:273, c(1,19)],aes(y = V273L_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,19)], aes(x= 273, y = 1.091, color = "V273L"), size = 3) + 
  
  geom_line(d = d[265:273, c(1,20)],aes(y = L275F_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,20)], aes(x= 275, y = 1.118, color = "L275F"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("V225F" = "blue", "K235T" = "dark cyan", "V273L" = "maroon", 
                                                    "L275F" = "navy")) +
  theme(legend.position = c(-3.3,0.91))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
