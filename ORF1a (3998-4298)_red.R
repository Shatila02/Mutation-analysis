library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "ORF1a.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[3998:4298,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("ORF1a Protein (4000-4300)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"), text = element_text(size = 120), axis.ticks.length = unit(2,"inch")) +
  
  geom_line(d = d[4026:4036, c(1,29)],aes(y = F4034Q_Score), color = "blue", size = 5) + 
  geom_point(d = d[,c(1,29)], aes(x= 4034, y = 0.998, color = "F4034Q"), size = 30) +
  
  geom_line(d = d[4054:4064, c(1,30)],aes(y = I4061Q_Score), color = "dark cyan", size = 5) + 
  geom_point(d = d[,c(1,30)], aes(x= 4061, y = 1.082, color = "I4061Q"), size = 30) +
  
  geom_line(d = d[4055:4065, c(1,31)],aes(y = I4062Q_Score), color = "purple", size = 5) + 
  geom_point(d = d[,c(1,31)], aes(x= 4062, y = 1.059, color = "I4062Q"), size = 30) +
  
  geom_line(d = d[4164:4174, c(1,32)],aes(y = Y4171A_Score), color = "maroon", size = 5) + 
  geom_point(d = d[,c(1,32)], aes(x= 4171, y = 1.041, color = "Y4171A"), size = 30) + 
  
  geom_line(d = d[4225:4239, c(1,33)],aes(y = L4234S_Score), color = "orchid", size = 5) + 
  geom_point(d = d[,c(1,33)], aes(x= 4234, y = 0.967, color = "L4234S"), size = 30) +
  
  geom_line(d = d[4236:4246, c(1,34)],aes(y = V4242W_Score), color = "dark green", size = 5) + 
  geom_point(d = d[,c(1,34)], aes(x= 4242, y = 0.943, color = "V4242W"), size = 30) +
  
  geom_line(d = d[4235:4244, c(1,35)],aes(y = L4243A_Score), color = "black", size = 5) + 
  geom_point(d = d[,c(1,35)], aes(x= 4243, y = 1.04, color = "L4243A"), size = 30) +
  
  geom_line(d = d[4239:4249, c(1,36)],aes(y = L4246S_Score), color = "saddle brown", size = 5) + 
  geom_point(d = d[,c(1,36)], aes(x= 4246, y = 1.026, color = "L4246S"), size = 30) + 
  
  geom_line(d = d[4241:4253, c(1,37)],aes(y = V4250A_Score), color = "navy", size = 5) + 
  geom_point(d = d[,c(1,37)], aes(x= 4250, y = 1.034, color = "V4250A"), size = 30) + 
  
  geom_line(d = d[4242:4256, c(1,38)],aes(y = L4252S_Score), color = "chocolate", size = 5) + 
  geom_point(d = d[,c(1,38)], aes(x= 4252, y = 1.019, color = "L4252S"), size = 30) + 
  
  geom_line(d = d[4245:4257, c(1,39)],aes(y = Q4253T_Score), color = "slate gray", size = 5) + 
  geom_point(d = d[,c(1,39)], aes(x= 4253, y = 1.018, color = "Q4253T"), size = 30) + 
  
  scale_color_manual(name = "Mutations", values = c("F4034Q" = "blue", "I4061Q" = "dark cyan" ,"I4062Q" = "purple","Y4171A" = "maroon",
                                                    "L4234S" = "orchid", "V4242W" = "dark green", "L4243A" = "black", 
                                                    "L4246S" = "saddle brown", "V4250A" = "navy", "L4252S" = "chocolate", "Q4253T" = "slate gray")) +
  theme(legend.position = c(-3,0.9), legend.key.size = unit(4, "cm"),
        legend.key.width = unit(4,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
