library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF1a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[2198:2648,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha= 0.5, cex = 5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF1a Protein (2200-2648)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"), text = element_text(size = 120), axis.ticks.length = unit(2,"inch")) +
  
  geom_line(d = d[2210:2222, c(1,3)],aes(y = L2218D_Score), color = "blue", size = 5) + 
  geom_point(d = d[, c(1,3)], aes(x= 2218, y = 0.986, color = "L2218D"), size = 30) +
  
  geom_line(d = d[2235:2249, c(1,4)],aes(y = Y2245A_Score), color = "dark cyan", size = 5) + 
  geom_point(d = d[,c(1,4)], aes(x= 2245, y = 1.066, color = "Y2245A"), size = 30) +
  
  geom_line(d = d[2413:2425, c(1,5)],aes(y = R2420N_Score), color = "purple", size = 5) + 
  geom_point(d = d[,c(1,5)], aes(x= 2420, y = 1.038, color = "R2420N"), size = 30) +
  
  geom_line(d = d[2497:2508, c(1,6)],aes(y = Y2504M_Score), color = "maroon", size = 5) + 
  geom_point(d = d[,c(1,6)], aes(x= 2504, y = 1.031, color = "Y2504M"), size = 30) + 
  
  geom_line(d = d[2592:2602, c(1,7)],aes(y = F2598N_Score), color = "dark green", size = 5) + 
  geom_point(d = d[,c(1,7)], aes(x= 2598, y = 0.968, color = "F2598N"), size = 30) +
  
  geom_line(d = d[2595:2606, c(1,8)],aes(y = F2602Q_Score), color = "saddle brown", size = 5) + 
  geom_point(d = d[,c(1,8)], aes(x= 2602, y = 1.024, color = "F2602Q"), size = 30) +
  
  scale_color_manual(name = "Mutations", values = c("L2218D" = "blue", "Y2245A" = "dark cyan" ,"R2420N" = "purple","Y2504M" = "maroon",
                                                    "F2598N" = "dark green", "F2602Q" = "saddle brown")) +
  theme(legend.position = c(-4,0.9), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
