setwd("C:/Users/dan_9/Desktop/DSO 545/MIDTERM")
library(ggplot2)
library(dplyr)

C2 = read.csv("Case_02.csv")
glimpse(C2)


ggplot(C2 ,  aes(x = Year, y= Precipitation , color = City)) + geom_line()+
  scale_x_continuous(breaks = seq(2006,2015,1))+
  ylab("Total Yearly Precipitation")+
  ggtitle("Precipitation in major California Cities, 2006-2015")+
  theme(plot.title = element_text(size=22), legend.title = element_text(size=20) )

