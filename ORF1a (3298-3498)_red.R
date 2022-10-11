library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF1a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[3298:3498,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF1a Protein (3300-3500)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"), text = element_text(size = 120), axis.ticks.length = unit(2,"inch")) +
  
  geom_line(d = d[3331:3341, c(1,16)],aes(y = L3338F_Score), color = "blue", size = 5) + 
  geom_point(d = d[, c(1,16)], aes(x= 3338, y = 1.096, color = "L3338F"), size = 30) +
  
  geom_line(d = d[3369:3380, c(1,17)],aes(y = V3377H_Score), color = "dark cyan", size = 5) + 
  geom_point(d = d[,c(1,17)], aes(x= 3377, y = 1.12, color = "V3377H"), size = 30) +
  
  geom_line(d = d[3465:3474, c(1,18)],aes(y = Y3472Q_Score), color = "purple", size = 5) + 
  geom_point(d = d[,c(1,18)], aes(x= 3472, y = 1.105, color = "Y3472Q"), size = 30) +
  
  geom_line(d = d[3468:3479, c(1,19)],aes(y = I3476A_Score), color = "maroon", size = 5) + 
  geom_point(d = d[,c(1,19)], aes(x= 3476, y = 1.013, color = "I3476A"), size = 30) + 
  
  scale_color_manual(name = "Mutations", values = c("L3338F" = "blue", "V3377H" = "dark cyan" ,"Y3472Q" = "purple","I3476A" = "maroon")) +
  theme(legend.position = c(-4,0.9), legend.key.size = unit(4, "cm"), legend.key.width = unit(4,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
