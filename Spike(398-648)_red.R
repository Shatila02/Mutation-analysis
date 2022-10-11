library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "S.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[398:648,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("Spike Protein (400-650)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 40)) +
  
  geom_line(d = d[413:423, c(1,10)],aes(y = Y421A_Score), color = "dark blue", size = 1) + 
  geom_point(d = d[,c(1,10)], aes(x= 421, y = 1.002, color = "Y421A"), size = 3) +
  
  geom_line(d = d[415:425, c(1,11)],aes(y = Y423W_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,11)], aes(x= 423, y = 0.991, color = "Y423W"), size = 3) +
  
  geom_line(d = d[423:435, c(1,12)],aes(y = C432F_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,12)], aes(x= 432, y = 1.081, color = "C432F"), size = 3) +
  
  geom_line(d = d[423:435, c(1,13)],aes(y = C432L_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,13)], aes(x= 432, y = 1.103, color = "C432L"), size = 3) + 
  
  geom_line(d = d[523:535, c(1,14)],aes(y = L533K_Score), color = "dark orchid", size = 1) + 
  geom_point(d = d[,c(1,14)], aes(x= 533, y = 0.959, color = "L533K"), size = 3) +
  
  geom_line(d = d[524:536, c(1,15)],aes(y = V534W_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,15)], aes(x= 534, y = 0.923, color = "V534W"), size = 3) +
  
  geom_line(d = d[532:544, c(1,16)],aes(y = C538V_Score), color = "black", size = 1) + 
  geom_point(d = d[,c(1,16)], aes(x= 538, y = 1.038, color = "C538V"), size = 3) +
  
  geom_line(d = d[532:543, c(1,17)],aes(y = V539Y_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,17)], aes(x= 539, y = 0.989, color = "V539Y"), size = 3) + 
  
  geom_line(d = d[544:553, c(1,18)],aes(y = V551Q_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,18)], aes(x= 551, y = 0.955, color = "V551Q"), size = 3) + 
  
  geom_line(d = d[581:592, c(1,19)],aes(y = P589Q_Score), color = "chocolate", size = 1) + 
  geom_point(d = d[,c(1,19)], aes(x= 589, y = 1.065, color = "P589Q"), size = 3) + 
  
  geom_line(d = d[588:602, c(1,20)],aes(y = V597H_Score), color = "dark slate gray", size = 1) + 
  geom_point(d = d[,c(1,20)], aes(x= 597, y = 1.071, color = "V597H"), size = 3) + 
  
  geom_line(d = d[602:614, c(1,21)],aes(y = L611K_Score), color = "dark olive green", size = 1) + 
  geom_point(d = d[,c(1,21)], aes(x= 611, y = 1.115, color = "L611K"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("Y421A" = "dark blue", "Y423W" = "dark cyan" ,"C432F" = "purple","C432L" = "maroon",
                                                    "L533K" = "dark orchid", "V534W" = "dark green", "C538V" = "black", 
                                                    "V539Y" = "saddle brown", "V551Q" = "navy", "P589Q" = "chocolate", "V597H" = "dark slate gray", "L611k" = "dark olive green")) +
  theme(legend.position = c(-5,0.84), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
