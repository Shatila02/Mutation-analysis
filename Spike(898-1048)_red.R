library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "S.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[898:1048,], aes(x= Position,y= Wild_Score), cex = 5) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), cex = 5, alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("Spike Protein (900-1050)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 40)) +
  
  geom_line(d = d[900:913, c(1,35)],aes(y = V911Y_Score), color = "dark blue", size = 1) + 
  geom_point(d = d[,c(1,35)], aes(x= 911, y = 0.966, color = "V911Y"), size = 3) +
  
  geom_line(d = d[904:915, c(1,36)],aes(y = Q913W_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,36)], aes(x= 913, y = 1.067, color = "Q913W"), size = 3) +
  
  geom_line(d = d[905:917, c(1,37)],aes(y = V915W_Score), color = "purple", size = 1) + 
  geom_point(d = d[,c(1,37)], aes(x= 915, y = 0.979, color = "V915W"), size = 3) +
  
  geom_line(d = d[905:917, c(1,38)],aes(y = V915S_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,38)], aes(x= 915, y = 0.996, color = "V915S"), size = 3) + 
  
  geom_line(d = d[908:918, c(1,39)],aes(y = L916S_Score), color = "dark orchid", size = 1) + 
  geom_point(d = d[,c(1,39)], aes(x= 916, y = 0.996, color = "L916S"), size = 3) +
  
  geom_line(d = d[915:925, c(1,40)],aes(y = I923W_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,40)], aes(x= 923, y = 0.992, color = "I923W"), size = 3) +
  
  geom_line(d = d[917:926, c(1,41)],aes(y = A924Q_Score), color = "black", size = 1) + 
  geom_point(d = d[,c(1,41)], aes(x= 924, y = 1.033, color = "A924Q"), size = 3) +
  
  geom_line(d = d[917:926, c(1,42)],aes(y = A924T_Score), color = "saddle brown", size = 1) + 
  geom_point(d = d[,c(1,42)], aes(x= 924, y = 1.018, color = "A924T"), size = 3) + 
  
  geom_line(d = d[936:946, c(1,43)],aes(y = A944R_Score), color = "navy", size = 1) + 
  geom_point(d = d[,c(1,43)], aes(x= 944, y = 0.987, color = "A944R"), size = 3) + 
  
  geom_line(d = d[940:950, c(1,44)],aes(y = L948T_Score), color = "chocolate", size = 1) + 
  geom_point(d = d[,c(1,44)], aes(x= 948, y = 1.032, color = "L948T"), size = 3) + 
  
  geom_line(d = d[1025:1035, c(1,45)],aes(y = V1033A_Score), color = "dark slate gray", size = 1) + 
  geom_point(d = d[,c(1,45)], aes(x= 1033, y = 1.068, color = "V1033A"), size = 3) + 
  
  scale_color_manual(name = "Mutations", values = c("V911Y" = "dark blue", "Q913W" = "dark cyan" ,"V915W" = "purple","V915S" = "maroon",
                                                    "L916S" = "dark orchid", "I923W" = "dark green", "A924Q" = "black", 
                                                    "A924T" = "saddle brown", "A944R" = "navy", "L948T" = "chocolate", "V1033A" = "dark slate gray")) +
  theme(legend.position = c(-5,0.84), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
