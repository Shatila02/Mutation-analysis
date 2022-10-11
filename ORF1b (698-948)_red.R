library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF1b.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[698:948,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF1b Protein (700-950)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"), text = element_text(size = 120), axis.ticks.length = unit(2,"inch")) +
  
  geom_line(d = d[730:742, c(1,11)],aes(y = Y737T_Score), color = "blue", size = 5) + 
  geom_point(d = d[,c(1,11)], aes(x= 737, y = 1.015, color = "Y737T"), size = 30) +
  
  geom_line(d = d[731:743, c(1,12)],aes(y = Y739T_Score), color = "dark cyan", size = 5) + 
  geom_point(d = d[,c(1,12)], aes(x= 739, y = 1.04, color = "Y739T"), size = 30) +
  
  geom_line(d = d[838:850, c(1,13)],aes(y = I847A_Score), color = "purple", size = 5) + 
  geom_point(d = d[,c(1,13)], aes(x= 847, y = 0.981, color = "I847A"), size = 30) +
  
  geom_line(d = d[840:854, c(1,14)],aes(y = F850T_Score), color = "maroon", size = 5) + 
  geom_point(d = d[,c(1,14)], aes(x= 850, y = 1.061, color = "F850T"), size = 30) + 
  
  geom_line(d = d[843:855, c(1,15)],aes(y = V851H_Score), color = "orchid", size = 5) + 
  geom_point(d = d[,c(1,15)], aes(x= 851, y = 1.035, color = "V851H"), size = 30) +
  
  geom_line(d = d[883:895, c(1,16)],aes(y = L891K_Score), color = "dark green", size = 5) + 
  geom_point(d = d[,c(1,16)], aes(x= 891, y = 0.941, color = "L891K"), size = 30) +
  
  geom_line(d = d[883:897, c(1,17)],aes(y = Y894A_Score), color = "black", size = 5) + 
  geom_point(d = d[,c(1,17)], aes(x= 894, y = 1.032, color = "Y894A"), size = 30) +
  
  geom_line(d = d[885:897, c(1,18)],aes(y = Y894M_Score), color = "saddle brown", size = 5) + 
  geom_point(d = d[,c(1,18)], aes(x= 894, y = 0.998, color = "Y894M"), size = 30) + 
  
  geom_line(d = d[888:904, c(1,19)],aes(y = L898D_Score), color = "navy", size = 5) + 
  geom_point(d = d[,c(1,19)], aes(x= 898, y = 0.948, color = "L898D"), size = 30) + 
  
  scale_color_manual(name = "Mutations", values = c("Y737T" = "blue", "Y739T" = "dark cyan" ,"I847A" = "purple","F850T" = "maroon",
                                                    "V851H" = "orchid", "L891K" = "dark green", "Y894A" = "black", 
                                                    "Y894M" = "saddle brown", "L898D" = "navy")) +
  theme(legend.position = c(-3,0.9), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
