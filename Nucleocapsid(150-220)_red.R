library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "N.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[150:220,], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions",) + 
  geom_line(aes(y=1)) + ggtitle("Nucleocapsid Protein (152-222)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 44)) +
  
  geom_line(d = d[154:164, c(1,7)],aes(y = P162L_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,7)], aes(x= 162, y = 1.08, color = "P162L"), size = 3) +
  
  geom_line(d = d[158:166, c(1,8)],aes(y = G164R_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,8)], aes(x= 164, y = 1.039, color = "G164R"), size = 3) +
  
  geom_line(d = d[160:170, c(1,9)],aes(y = P168S_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,9)], aes(x= 168, y = 0.996, color = "P168S"), size = 3) + 
  
  geom_line(d = d[172:183, c(1,10)],aes(y = S180I_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,10)], aes(x= 180, y = 0.981, color = "S180I"), size = 3) +
  
  geom_line(d = d[185:195, c(1,11)],aes(y = S193I_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,11)], aes(x= 193, y = 0.925, color = "S193I"), size = 3) +
  
  geom_line(d = d[186:196, c(1,12)],aes(y = S194L_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,12)], aes(x= 194, y = 0.939, color = "S194L"), size = 3) +
  
  geom_line(d = d[187:197, c(1,13)],aes(y = R195I_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,13)], aes(x= 195, y = 0.95, color = "R195I"), size = 3) +
  
  geom_line(d = d[195:205, c(1,14)],aes(y = R203M_Score), color = "steel blue", size = 1) + 
  geom_point(d = d[,c(1,14)], aes(x= 203, y = 0.931, color = "R203M"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("P162L" = "blue", "G164R" = "dark cyan", "P168S" = "maroon", 
                                                    "S180I" = "navy", "S193I" = "purple", "S194L" = "dark green", 
                                                    "R195I" = "saddle brown", "R203M" = "steel blue")) +
  theme(legend.position = c(-3,0.92), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
