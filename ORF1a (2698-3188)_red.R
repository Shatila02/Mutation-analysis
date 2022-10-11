library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF1a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[2698:3188,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF1a Protein (2700-3190)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"), text = element_text(size = 120), axis.ticks.length = unit(2,"inch")) +
  
  geom_line(d = d[2705:2714, c(1,9)],aes(y = L2712R_Score), color = "blue", size = 5) + 
  geom_point(d = d[,c(1,9)], aes(x= 2712, y = 1.056, color = "L2712R"), size = 30) +
  
  geom_line(d = d[2876:2886, c(1,10)],aes(y = H2883E_Score), color = "dark cyan", size = 5) + 
  geom_point(d = d[,c(1,10)], aes(x= 2883, y = 1.066, color = "L2948T"), size = 30) +
  
  geom_line(d = d[2889:2903, c(1,11)],aes(y = Y2897N_Score), color = "purple", size = 5) + 
  geom_point(d = d[,c(1,11)], aes(x= 2897, y = 1.014, color = "L2897N"), size = 30) +
  
  geom_line(d = d[2889:2903, c(1,12)],aes(y = Y2897S_Score), color = "maroon", size = 5) + 
  geom_point(d = d[,c(1,12)], aes(x= 2897, y = 1.048, color = "L2897S"), size = 30) + 
  
  geom_line(d = d[2939:2950, c(1,13)],aes(y = L2948T_Score), color = "orchid", size = 5) + 
  geom_point(d = d[,c(1,13)], aes(x= 2948, y = 0.962, color = "L2948T"), size = 30) +
  
  geom_line(d = d[3065:3077, c(1,14)],aes(y = Y3074E_Score), color = "dark green", size = 5) + 
  geom_point(d = d[,c(1,14)], aes(x= 3074, y = 1.024, color = "Y3074E"), size = 30) +
  
  geom_line(d = d[3135:3148, c(1,15)],aes(y = Y3144D_Score), color = "black", size = 5) + 
  geom_point(d = d[,c(1,15)], aes(x= 3144, y = 1.101, color = "Y3144D"), size = 30) +
  
  scale_color_manual(name = "Mutations", values = c("L2712R" = "blue", "H2883E" = "dark cyan" ,"Y2897N" = "purple","Y2897S" = "maroon",
                                                    "L2948T" = "orchid", "Y3074E" = "dark green", "Y3144D" = "black")) +
  theme(legend.position = c(-4,0.9), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
