library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF8.csv", sep = ",", header = TRUE)

d1 <- ggplot(d, aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF8") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(0.5, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 45)) +
  
  geom_line(d = d[2:13, c(1,3)],aes(y = I10N_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 10, y = 1.036, color = "I10N"), size = 3) +
  
  geom_line(d = d[29:41, c(1,4)],aes(y = C37F_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 37, y = 1.03, color = "C37F"), size = 3) +
  
  geom_line(d = d[94:104, c(1,5)],aes(y = C102F_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 102, y = 1.142, color = "C102F"), size = 3) +
  
  geom_line(d = d[94:104, c(1,6)],aes(y = C102Y_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,6)], aes(x= 102, y = 1.152, color = "C102Y"), size = 3) +
  
  geom_line(d = d[113:123, c(1,7)],aes(y = F120A_Score), color = "black", size = 1) + 
  geom_point(d = d[,c(1,7)], aes(x= 120, y = 1.145, color = "F120A"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("I10N" = "dark cyan", "C37F" = "blue", "C102F" = "maroon", "C102Y" = "dark green", "F120A" = "black")) +
  theme(legend.position = c(-3,0.93), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
