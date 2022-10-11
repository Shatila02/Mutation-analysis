library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "S.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[718:898,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("Spike Protein (720-900)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 40)) +
  
  geom_line(d = d[728:743, c(1,22)],aes(y = C738N_Score), color = "dark blue", size = 1) + 
  geom_point(d = d[,c(1,22)], aes(x= 738, y = 0.99, color = "C738N"), size = 3) +
  
  geom_line(d = d[749:758, c(1,23)],aes(y = Y756Q_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,23)], aes(x= 756, y = 1.072, color = "Y756Q"), size = 3) +
  
  geom_line(d = d[754:766, c(1,24)],aes(y = L763W_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,24)], aes(x= 763, y = 0.992, color = "L763W"), size = 3) +
  
  geom_line(d = d[760:770, c(1,25)],aes(y = L767A_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,25)], aes(x= 767, y = 0.959, color = "L767A"), size = 3) + 
  
  geom_line(d = d[772:785, c(1,26)],aes(y = V781D_Score), color = "dark orchid", size = 1) + 
  geom_point(d = d[,c(1,26)], aes(x= 781, y = 0.973, color = "V781D"), size = 3) +
  
  geom_line(d = d[795:807, c(1,27)],aes(y = I805N_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,27)], aes(x= 805, y = 1.011, color = "I805N"), size = 3) +
  
  geom_line(d = d[805:817, c(1,28)],aes(y = R815E_Score), color = "black", size = 1) + 
  geom_point(d = d[,c(1,28)], aes(x= 815, y = 1.016, color = "R815E"), size = 3) +
  
  geom_line(d = d[830:840, c(1,29)],aes(y = Y837S_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,29)], aes(x= 837, y = 1.037, color = "Y837S"), size = 3) + 
  
  geom_line(d = d[844:850, c(1,30)],aes(y = L849Y_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,30)], aes(x= 849, y = 1.085, color = "L849Y"), size = 3) + 
  
  geom_line(d = d[843:852, c(1,31)],aes(y = C851F_Score), color = "chocolate", size = 1) + 
  geom_point(d = d[,c(1,31)], aes(x= 851, y = 1.053, color = "C851F"), size = 3) + 
  
  geom_line(d = d[853:862, c(1,32)],aes(y = V860F_Score), color = "dark slate gray", size = 1) + 
  geom_point(d = d[,c(1,32)], aes(x= 860, y = 1.072, color = "V860F"), size = 3) + 
  
  geom_line(d = d[869:879, c(1,33)],aes(y = L877W_Score), color = "dark olive green", size = 1) + 
  geom_point(d = d[,c(1,33)], aes(x= 877, y = 1.009, color = "L877W"), size = 3) +
  
  geom_line(d = d[879:887, c(1,34)],aes(y = W886N_Score), color = "chocolate", size = 1) + 
  geom_point(d = d[,c(1,34)], aes(x= 886, y = 0.921, color = "W886N"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("C738N" = "dark blue", "Y756Q" = "dark cyan" ,"L763W" = "purple","L767A" = "maroon",
                                                    "V781D" = "dark orchid", "I805N" = "dark green", "R815E" = "black", 
                                                    "Y837S" = "saddle brown", "L849Y" = "navy", "C851F" = "chocolate", "V860F" = "dark slate gray", "L877W" = "dark olive green", 
                                                    "W886N" = "chocolate")) +
  theme(legend.position = c(-5,0.82), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
