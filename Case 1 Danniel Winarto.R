setwd("C:/Users/dan_9/Desktop/DSO 545/MIDTERM")
library(ggplot2)
library(dplyr)

C1 = read.csv("Case_01.csv")
glimpse(C1)

# part a
filtered = C1 %>% filter(Age < 25) %>% filter(Salary < 10^6)
# Player Age Salary
# 1      Joc Pederson  22 510000
# 2 Enrique Hernandez  23 512500
# 3       Yimi Garcia  24 510000
# 4         Alex Wood  24 520000
# 5       Jose Peraza  20 507500
# 6    Scott Schebler  24 507500
# 7      Corey Seager  20 507500
# 8   Ronald Torreyes  22 507500

# 8 players in total


# part b

ggplot(filtered, aes( x = Salary, y = reorder(Player, Salary))) + geom_point() + ylab("") +
  scale_x_continuous(breaks = seq(508000, 520000,4000), labels =c("508K", "512K", "516K", "520K")  )


# part c
ansC = C1 %>% group_by(Age) %>% summarise(medianSalary = median(Salary))
# Age medianSalary
# (int)        (dbl)
# 1     20       507500
# 2     22       508750
# 3     23       512500
# 4     24       515000
# 5     25       518750
# 6     26       693000
# 7     27      7425000
# 8     28      2300000
# 9     30       522500
# 10    31      5500000
# 11    32     18000000
# 12    33     12803571
# 13    36      6565000
# 14    38      2500000