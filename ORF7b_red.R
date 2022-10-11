library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF7b.csv", sep = ",", header = TRUE)

d1 <- ggplot(d, aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF7b") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(0.5, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 45)) +
  
  geom_line(d = d[1:7, c(1,3)],aes(y = M1I_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 1, y = 1.076, color = "M1I"), size = 3) +
  
  geom_line(d = d[1:7, c(1,4)],aes(y = E3A_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 3, y = 1.146, color = "E3A"), size = 3) +
  
  geom_line(d = d[1:7, c(1,5)],aes(y = E3Q_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 3, y = 1.136, color = "E3Q"), size = 3) + 
  
  geom_line(d = d[7:18, c(1,6)],aes(y = L14S_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,6)], aes(x= 14, y = 1.102, color = "L14S"), size = 3) +
  
  geom_line(d = d[23:30, c(1,7)],aes(y = F28Y_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,7)], aes(x= 28, y = 1.062, color = "F28Y"), size = 3) +
  
  geom_line(d = d[24:32, c(1,8)],aes(y = W29C_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,8)], aes(x= 29, y = 1.171, color = "W29C"), size = 3) +
  
  geom_line(d = d[32:43, c(1,9)],aes(y = E39A_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,9)], aes(x= 39, y = 1.053, color = "E39A"), size = 3) +
  
  geom_line(d = d[35:43, c(1,10)],aes(y = C41F_Score), color = "steel blue", size = 1) + 
  geom_point(d = d[,c(1,10)], aes(x= 41, y = 1.023, color = "C41F"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("M1I" = "blue", "E3A" = "dark cyan","E3Q" = "maroon", 
                                                    "L14S" = "navy", "F28Y" = "purple", "W29C" = "dark green", 
                                                    "E39A" = "saddle brown", "C41F" = "steel blue")) +
  theme(legend.position = c(-3.7,0.89), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
