library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF3a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[18:98,], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF3a (20-100)") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  
  geom_line(d = d[26:38, c(1,3)],aes(y = I35T_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 35, y = 1.003, color = "I35T"), size = 3) +
  
  geom_line(d = d[30:40, c(1,4)],aes(y = Q38K_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 38, y = 1.089, color = "Q38K"), size = 3) +
  
  geom_line(d = d[34:43, c(1,5)],aes(y = L41F_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 41, y = 1.03, color = "L41F"), size = 3) + 
  
  geom_line(d = d[39:50, c(1,6)],aes(y = I47T_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,6)], aes(x= 47, y = 1.081, color = "I47T"), size = 3) +
  
  geom_line(d = d[45:55, c(1,7)],aes(y = L53F_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,7)], aes(x= 53, y = 1.189, color = "L53F"), size = 3) +
  
  geom_line(d = d[48:59, c(1,8)],aes(y = Q57R_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,8)], aes(x= 57, y = 1.071, color = "Q57R"), size = 3) +
  
  geom_line(d = d[65:75, c(1,9)],aes(y = L73F_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,9)], aes(x= 73, y = 1.034, color = "L73F"), size = 3) +
  
  geom_line(d = d[77:87, c(1,10)],aes(y = L85F_Score), color = "steel blue", size = 1) + 
  geom_point(d = d[,c(1,10)], aes(x= 85, y = 1.156, color = "L85F"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("I35T" = "blue", "Q38K" = "dark cyan","L41F" = "maroon", 
                                                    "I47T" = "navy", "L53F" = "purple", "Q57R" = "dark green", "L73F" = "saddle brown", 
                                                    "L85F" = "steel blue")) +
  theme(legend.position = c(-3.3,0.87))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
