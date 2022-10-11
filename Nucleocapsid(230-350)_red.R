library(ggplot2)
library(ggh4x)
library(cowplot)
setwd("F:/Projects/SUST_mutation/Graph_input")
d <- read.csv(file = "N.csv", sep = ",", header = TRUE)

d1 <- ggplot(d[230:350,], aes(x= Position,y= Wild_Score)) + xlab("Positions") + ylab("Scores") +
  stat_difference(aes(ymin = 1, ymax = Wild_Score), alpha = 0.5, levels = c("Antigenic", "Non antigenic", "Neutral")) + 
  scale_fill_discrete(name = "Regions") + 
  geom_line(aes(y=1)) + ggtitle("Nucleocapsid Protein (232-352)") + 
  theme(plot.title = element_text(hjust = 0.5), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"), text = element_text(size = 44)) +
  
  geom_line(d = d[240:252, c(1,15)],aes(y = K248N_Score), color = "dark cyan", size = 1) + 
  geom_point(d = d[,c(1,15)], aes(x= 248, y = 0.998, color = "K248N"), size = 3) +
  
  geom_line(d = d[242:253, c(1,16)],aes(y = A251V_Score), color = "blue", size = 1) + 
  geom_point(d = d[,c(1,16)], aes(x= 251, y = 1.033, color = "A251V"), size = 3) +
  
  geom_line(d = d[255:267, c(1,17)],aes(y = T265I_Score), color = "maroon", size = 1) + 
  geom_point(d = d[,c(1,17)], aes(x= 265, y = 1.022, color = "T265I"), size = 3) +
  
  geom_line(d = d[318:330, c(1,18)],aes(y = S327L_Score), color = "dark green", size = 1) + 
  geom_point(d = d[,c(1,18)], aes(x= 327, y = 1.04, color = "S327L"), size = 3) +
  
  scale_color_manual(name = "Mutations", values = c("K248N" = "dark cyan", "A251V" = "blue", "T265I" = "maroon", "S327L" = "dark green")) +
  theme(legend.position = c(-3,0.93), legend.key.size = unit(1, "cm"),
        legend.key.width = unit(1,"cm"))


Mutations <- get_legend(d1 + guides(fill = "none"))

plot_grid(d1 + guides(color = "none") + theme(legend.position = "bottom"), Mutations, ncol = 2, rel_widths = c(.9, .01))
