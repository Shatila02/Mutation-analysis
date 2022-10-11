library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "N.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[60:150,], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("Nucleocapsid Protein (62-152)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 20)) +
  
  geom_line(d = d[72:84, c(1,3)],aes(y = D81H_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 81, y = 1.032, color = "D81H"), size = 3) +
  
  geom_line(d = d[91:102, c(1,4)],aes(y = G99S_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 99, y = 0.902, color = "G99S"), size = 3) +
  
  geom_line(d = d[115:124, c(1,5)],aes(y = P122L_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 122, y = 1.077, color = "P122L"), size = 3) +
  
  geom_line(d = d[126:136, c(1,6)],aes(y = A134V_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,6)], aes(x= 134, y = 1.064, color = "A134V"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("D81H" = "dark cyan", "G99S" = "blue","P122L" = "maroon", "A134V" = "dark green")) +
  theme(legend.position = c(-5,0.85), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
