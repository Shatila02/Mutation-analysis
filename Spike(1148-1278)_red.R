library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "S.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[1148:1278, ], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("Spike Protein (1150-1280)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(0.5, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 45)) +
  
  geom_line(d = d[1194:1206, c(1,46)],aes(y = L1203F_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,46)], aes(x= 1203, y = 1.025, color = "L203F"), size = 3) +
  
  geom_line(d = d[1228:1238, c(1,47)],aes(y = C1236F_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,47)], aes(x= 1236, y = 1.047, color = "C1236F"), size = 3) +
  
  geom_line(d = d[1234:1245, c(1,48)],aes(y = C1243F_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,48)], aes(x= 1243, y = 1.14, color = "C1243F"), size = 3) + 
  
  geom_line(d = d[1239:1253, c(1,49)],aes(y = C1250R_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,49)], aes(x= 1250, y = 1.144, color = "C1250R"), size = 3) +
  
  geom_line(d = d[1242:1255, c(1,50)],aes(y = C1253F_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,50)], aes(x= 1253, y = 1.117, color = "C1253F"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("L1203F" = "blue", "C1236F" = "dark cyan", "C1243F" = "maroon", 
                                                    "C1250R" = "navy", "C1253F" = "purple")) +
  theme(legend.position = c(-5,0.88), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
