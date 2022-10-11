library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF6.csv", sep = ",", header = TRUE)

d1 <- ggplot(d, aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF6") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(0.5, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 45)) +
  
  geom_line(d = d[1:7, c(1,3)],aes(y = H3Y_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 3, y = 1.058, color = "H3Y"), size = 3) +
  
  geom_line(d = d[13:23, c(1,4)],aes(y = M19T_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 19, y = 1.048, color = "A103T"), size = 3) +
  
  geom_line(d = d[15:25, c(1,5)],aes(y = R20S_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 20, y = 1.01, color = "L106F"), size = 3) + 
  
  geom_line(d = d[22:32, c(1,6)],aes(y = W27L_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,6)], aes(x= 27, y = 1.098, color = "W27L"), size = 3) +
  
  geom_line(d = d[33:42, c(1,7)],aes(y = I37T_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,7)], aes(x= 37, y = 1.006, color = "I37T"), size = 3) +
  
  geom_line(d = d[46:59, c(1,8)],aes(y = D53Y_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,8)], aes(x= 53, y = 1.022, color = "D53Y"), size = 3) +
  
  geom_line(d = d[46:57, c(1,9)],aes(y = E54A_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,9)], aes(x= 54, y = 1.018, color = "E54A"), size = 3) +
  
  geom_line(d = d[54:62, c(1,10)],aes(y = E59A_Score), color = "steel blue", size = 1) + 
  geom_point(d = d[,c(1,10)], aes(x= 59, y = 1.005, color = "E59A"), size = 3) +
  
  geom_line(d = d[55:63, c(1,11)],aes(y = D61L_Score), color = "dim grey", size = 1) + 
  geom_point(d = d[,c(1,11)], aes(x= 61, y = 1.145, color = "D61L"), size = 3) +
  
  geom_line(d = d[55:64, c(1,12)],aes(y = D61H_Score), color = "red", size = 1) + 
  geom_point(d = d[,c(1,12)], aes(x= 61, y = 1.099, color = "D61H"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("H3Y" = "blue", "M19T" = "dark cyan","R20S" = "maroon", 
                                                    "W27L" = "navy", "I37T" = "purple", "D53Y" = "dark green", 
                                                    "E54A" = "saddle brown", "E59A" = "steel blue", "D61L" = "dim grey", 
                                                    "D61H" = "red")) +
  theme(legend.position = c(-9,0.87), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
