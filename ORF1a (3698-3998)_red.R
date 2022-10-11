library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF1a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[3698:3998,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF1a Protein (3700-4000)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"), text = element_text(size = 120), axis.ticks.length = unit(2,"inch")) +
  
  geom_line(d = d[3746:3757, c(1,20)],aes(y = L3754G_Score), color = "blue", size = 5) + 
  geom_point(d = d[,c(1,20)], aes(x= 3754, y = 0.998, color = "L3754G"), size = 30) +
  
  geom_line(d = d[3797:3809, c(1,21)],aes(y = L3806Q_Score), color = "dark cyan", size = 5) + 
  geom_point(d = d[,c(1,21)], aes(x= 3806, y = 1.025, color = "L3806Q"), size = 30) +
  
  geom_line(d = d[3800:3814, c(1,22)],aes(y = Y3811F_Score), color = "purple", size = 5) + 
  geom_point(d = d[,c(1,22)], aes(x= 3811, y = 1.125, color = "Y3811F"), size = 30) +
  
  geom_line(d = d[3802:3816, c(1,23)],aes(y = Y3813T_Score), color = "maroon", size = 5) + 
  geom_point(d = d[,c(1,23)], aes(x= 3813, y = 1.138, color = "Y3813T"), size = 30) + 
  
  geom_line(d = d[3863:3874, c(1,24)],aes(y = V3871T_Score), color = "orchid", size = 5) + 
  geom_point(d = d[,c(1,24)], aes(x= 3871, y = 1.104, color = "V3871T"), size = 30) +
  
  geom_line(d = d[3870:3884, c(1,25)],aes(y = L3879S_Score), color = "dark green", size = 5) + 
  geom_point(d = d[,c(1,25)], aes(x= 3879, y = 1.057, color = "L3879S"), size = 30) +
  
  geom_line(d = d[3910:3924, c(1,26)],aes(y = L3919A_Score), color = "black", size = 5) + 
  geom_point(d = d[,c(1,26)], aes(x= 3919, y = 1.08, color = "L3919A"), size = 30) +
  
  geom_line(d = d[3940:3954, c(1,27)],aes(y = F3948Q_Score), color = "saddle brown", size = 5) + 
  geom_point(d = d[,c(1,27)], aes(x= 3948, y = 1.031, color = "F3948Q"), size = 30) + 
  
  geom_line(d = d[3940:3954, c(1,28)],aes(y = F3948S_Score), color = "navy", size = 5) + 
  geom_point(d = d[,c(1,28)], aes(x= 3948, y = 1.03, color = "F3948S"), size = 30) + 
  
  scale_color_manual(name = "Mutations", values = c("L3754G" = "blue", "L3806Q" = "dark cyan" ,"Y3811F" = "purple","Y3813T" = "maroon",
                                                    "V3871T" = "orchid", "L3879S" = "dark green", "L3919A" = "black", 
                                                    "F3948Q" = "saddle brown", "F3948S" = "navy")) +
  theme(legend.position = c(-4,0.88), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
