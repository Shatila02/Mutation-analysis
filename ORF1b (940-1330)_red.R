library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF1b.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[938:1328,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF1b Protein (940-1330)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(3, "cm"),
        legend.key.width = unit(3,"cm"), text = element_text(size = 200), axis.ticks.length = unit(3,"inch")) +
  
  geom_line(d = d[950:960, c(1,20)],aes(y = I958N_Score), color = "blue", size = 5) + 
  geom_point(d = d[,c(1,20)], aes(x= 958, y = 1.009, color = "I958N"), size = 30) +
  
  geom_line(d = d[958:968, c(1,21)],aes(y = L966F_Score), color = "dark cyan", size = 5) + 
  geom_point(d = d[,c(1,21)], aes(x= 966, y = 1.118, color = "L966F"), size = 30) +
  
  geom_line(d = d[960:970, c(1,22)],aes(y = V968S_Score), color = "purple", size = 5) + 
  geom_point(d = d[,c(1,22)], aes(x= 968, y = 1.094, color = "V968S"), size = 30) +
  
  geom_line(d = d[962:975, c(1,23)],aes(y = V972Q_Score), color = "maroon", size = 5) + 
  geom_point(d = d[,c(1,23)], aes(x= 972, y = 1.038, color = "V972Q"), size = 30) + 
  
  geom_line(d = d[1224:1232, c(1,24)],aes(y = A1231S_Score), color = "orchid", size = 5) + 
  geom_point(d = d[,c(1,24)], aes(x= 1231, y = 1.142, color = "A1231S"), size = 30) +
  
  geom_line(d = d[1306:1316, c(1,25)],aes(y = L1314S_Score), color = "dark green", size = 5) + 
  geom_point(d = d[,c(1,25)], aes(x= 1314, y = 0.942, color = "L1314S"), size = 30) +
  
  scale_color_manual(name = "Mutations", values = c("I958N" = "blue", "L966F" = "dark cyan" ,"V968S" = "purple","V972Q" = "maroon",
                                                    "A1231S" = "orchid", "L1314S" = "dark green")) +
  theme(legend.position = c(-5,0.86), legend.key.size = unit(3, "cm"),
        legend.key.width = unit(3,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
