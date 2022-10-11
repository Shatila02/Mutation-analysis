library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF9b.csv", sep = ",", header = TRUE)

d1 <- ggplot(d, aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions",) + 
  geom_line(aes(y=1)) + ggtitle("ORF9b") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(0.5, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 45)) +
  
  geom_line(d = d[1:4, c(1,3)],aes(y = P3S_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 3, y = 0.994, color = "P3S"), size = 3) +
  
  geom_line(d = d[5:13, c(1,4)],aes(y = A11S_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 11, y = 1.09, color = "A11S"), size = 3) +
  
  geom_line(d = d[8:17, c(1,5)],aes(y = L14F_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 14, y = 1.055, color = "L14F"), size = 3) + 
  
  geom_line(d = d[23:32, c(1,6)],aes(y = A29T_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,6)], aes(x= 29, y = 0.963, color = "A29T"), size = 3) +
  
  geom_line(d = d[38:47, c(1,7)],aes(y = I45T_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,7)], aes(x= 45, y = 1.087, color = "I45T"), size = 3) +
  
  geom_line(d = d[47:54, c(1,8)],aes(y = L52P_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,8)], aes(x= 52, y = 1.033, color = "L52P"), size = 3) +
  
  geom_line(d = d[56:67, c(1,9)],aes(y = L64P_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,9)], aes(x= 64, y = 0.945, color = "L64P"), size = 3) +
  
  geom_line(d = d[68:79, c(1,10)],aes(y = V76F_Score), color = "steel blue", size = 1) + 
  geom_point(d = d[,c(1,10)], aes(x= 76, y = 0.981, color = "V76F"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("P3S" = "blue", "A11S" = "dark cyan", "L14F" = "maroon", 
                                                    "A29T" = "navy", "I45T" = "purple", "L52P" = "dark green", 
                                                    "L64P" = "saddle brown", "V76F" = "steel blue")) +
  theme(legend.position = c(-3.3,0.9), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
