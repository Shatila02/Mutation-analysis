library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "S.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[98:398, ], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions",) + 
  geom_line(aes(y=1)) + ggtitle("Spike Protein (100-400)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(0.5, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 45)) +
  
  geom_line(d = d[120:134, c(1,3)],aes(y = C131A_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 131, y = 1.069, color = "C131A"), size = 3) +
  
  geom_line(d = d[268:280, c(1,4)],aes(y = L276G_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 276, y = 1.013, color = "L276G"), size = 3) +
  
  geom_line(d = d[269:282, c(1,5)],aes(y = Y279W_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 279, y = 0.961, color = "Y279W"), size = 3) + 
  
  geom_line(d = d[281:292, c(1,6)],aes(y = V289R_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,6)], aes(x= 289, y = 1.008, color = "V289R"), size = 3) +
  
  geom_line(d = d[292:304, c(1,7)],aes(y = C301L_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,7)], aes(x= 301, y = 1.004, color = "C301L"), size = 3) +
  
  geom_line(d = d[292:304, c(1,8)],aes(y = C301R_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,8)], aes(x= 301, y = 0.95, color = "C301R"), size = 3) +
  
  geom_line(d = d[343:357, c(1,9)],aes(y = W353R_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,9)], aes(x= 353, y = 1.009, color = "W353R"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("C131A" = "blue", "L276G" = "dark cyan", "Y279W" = "maroon", 
                                                    "V289R" = "navy", "C301L" = "purple", "C301R" = "dark green", 
                                                    "W353R" = "saddle brown")) +
  theme(legend.position = c(-5,0.86), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
