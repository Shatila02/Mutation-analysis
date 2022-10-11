library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF3a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[93:128,], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF3a (95-130)") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  
  geom_line(d = d[97:105, c(1,11)],aes(y = P104S_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,11)], aes(x= 104, y = 1.097, color = "P104S"), size = 3) +
  
  geom_line(d = d[98:108, c(1,12)],aes(y = L106F_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,12)], aes(x= 106, y = 1.126, color = "L106F"), size = 3) +
  
  geom_line(d = d[99:109, c(1,13)],aes(y = Y107H_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,13)], aes(x= 107, y = 1.141, color = "Y107H"), size = 3) + 
  
  geom_line(d = d[100:110, c(1,14)],aes(y = L108F_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,14)], aes(x= 108, y = 1.153, color = "L108F"), size = 3) +
  
  geom_line(d = d[104:114, c(1,15)],aes(y = V112F_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,15)], aes(x= 112, y = 1.153, color = "V112F"), size = 3) +
  
  geom_line(d = d[109:121, c(1,16)],aes(y = I118T_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,16)], aes(x= 118, y = 1.062, color = "I118T"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("P104S" = "blue", "L106F" = "dark cyan", "Y107H" = "maroon", 
                                                    "L108F" = "navy", "V112F" = "purple", "I118T" = "dark green")) +
  theme(legend.position = c(-3.3,0.89))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
