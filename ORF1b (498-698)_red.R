library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF1b.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[498:698,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF1b Protein (500-700)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"), text = element_text(size = 120), axis.ticks.length = unit(2,"inch")) +
  
  geom_line(d = d[530:540, c(1,3)],aes(y = Y537A_Score), color = "blue", size = 5) + 
  geom_point(d = d[,c(1,3)], aes(x= 537, y = 1.035, color = "Y537A"), size = 30) +
  
  geom_line(d = d[538:547, c(1,4)],aes(y = A545Q_Score), color = "dark cyan", size = 5) + 
  geom_point(d = d[,c(1,4)], aes(x= 545, y = 0.966, color = "A545Q"), size = 30) +
  
  geom_line(d = d[568:584, c(1,5)],aes(y = V579L_Score), color = "purple", size = 5) + 
  geom_point(d = d[,c(1,5)], aes(x= 579, y = 1.077, color = "V579L"), size = 30) +
  
  geom_line(d = d[570:584, c(1,6)],aes(y = I580G_Score), color = "maroon", size = 5) + 
  geom_point(d = d[,c(1,6)], aes(x= 580, y = 1.049, color = "I580G"), size = 30) + 
  
  geom_line(d = d[613:625, c(1,7)],aes(y = L621N_Score), color = "orchid", size = 5) + 
  geom_point(d = d[,c(1,7)], aes(x= 621, y = 0.899, color = "L621N"), size = 30) +
  
  geom_line(d = d[618:635, c(1,8)],aes(y = L629F_Score), color = "dark green", size = 5) + 
  geom_point(d = d[,c(1,8)], aes(x= 629, y = 1.086, color = "L629F"), size = 30) +
  
  geom_line(d = d[643:655, c(1,9)],aes(y = Q652T_Score), color = "black", size = 5) + 
  geom_point(d = d[,c(1,9)], aes(x= 652, y = 1.126, color = "Q652T"), size = 30) +
  
  geom_line(d = d[645:657, c(1,10)],aes(y = L654S_Score), color = "saddle brown", size = 5) + 
  geom_point(d = d[,c(1,10)], aes(x= 654, y = 1.023, color = "L654S"), size = 30) + 
  
  scale_color_manual(name = "Mutations", values = c("Y537A" = "blue", "A545Q" = "dark cyan" ,"V579L" = "purple","I580G" = "maroon",
                                                    "L621N" = "orchid", "L629F" = "dark green", "Q652T" = "black", 
                                                    "L654S" = "saddle brown")) +
  theme(legend.position = c(-3,0.9), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
