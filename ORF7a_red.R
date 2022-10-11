library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF7a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d, aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF7a") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(0.5, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 45)) +
  
  geom_line(d = d[1:4, c(1,3)],aes(y = K2R_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,3)], aes(x= 2, y = 1.051, color = "K2R"), size = 3) +
  
  geom_line(d = d[1:7, c(1,4)],aes(y = I4T_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,4)], aes(x= 4, y = 1.13, color = "I4T"), size = 3) +
  
  geom_line(d = d[4:13, c(1,5)],aes(y = I10T_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,5)], aes(x= 10, y = 1.076, color = "I10T"), size = 3) + 
  
  geom_line(d = d[10:20, c(1,6)],aes(y = L17F_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,6)], aes(x= 17, y = 1.074, color = "L17F"), size = 3) +
  
  geom_line(d = d[18:27, c(1,7)],aes(y = V24F_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,7)], aes(x= 24, y = 1.032, color = "V24F"), size = 3) +
  
  geom_line(d = d[38:43, c(1,8)],aes(y = G42D_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,8)], aes(x= 42, y = 0.914, color = "G42D"), size = 3) +
  
  geom_line(d = d[44:50, c(1,9)],aes(y = P48S_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,9)], aes(x= 48, y = 1.059, color = "P48S"), size = 3) +
  
  geom_line(d = d[52:62, c(1,10)],aes(y = C58F_Score), color = "steel blue", size = 1) + 
  geom_point(d = d[,c(1,10)], aes(x= 58, y = 1.002, color = "C58F"), size = 3) +
  
  geom_line(d = d[60:69, c(1,11)],aes(y = C67F_Score), color = "dim grey", size = 1) + 
  geom_point(d = d[,c(1,11)], aes(x= 67, y = 0.992, color = "C67F"), size = 3) +
  
  geom_line(d = d[69:76, c(1,12)],aes(y = V74F_Score), color = "red", size = 1) + 
  geom_point(d = d[,c(1,12)], aes(x= 74, y = 1.124, color = "V74F"), size = 3) +
  
  geom_line(d = d[74:82, c(1,13)],aes(y = R80T_Score), color = "dark slate gray", size = 1) + 
  geom_point(d = d[,c(1,13)], aes(x= 80, y = 1.076, color = "R80T"), size = 3) +
  
  geom_line(d = d[76:85, c(1,14)],aes(y = V82A_Score), color = "dark magenta", size = 1) + 
  geom_point(d = d[,c(1,14)], aes(x= 82, y = 1.016, color = "V82A"), size = 3) +
  
  geom_line(d = d[78:86, c(1,15)],aes(y = P84S_Score), color = "black", size = 1) + 
  geom_point(d = d[,c(1,15)], aes(x= 84, y = 1.059, color = "P84S"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("K2R" = "blue", "I4T" = "dark cyan","I10T" = "maroon", 
                                                    "L17F" = "navy", "V24F" = "purple", "G42D" = "dark green", "P48S" = "saddle brown", 
                                                    "C58F" = "steel blue", "C67F" = "dim grey", "V74F" = "red", "R80T" = "dark slate gray",
                                                    "V82A" = "dark magenta", "P84S" = "black")) +
  theme(legend.position = c(-3.4,0.87), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
