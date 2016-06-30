setwd("C:/Users/dan_9/Desktop/DSO 545/MIDTERM")
library(ggplot2)
library(dplyr)

C3 = read.csv("Case_03.csv")
glimpse(C3)

# Q1
Q1 = C3 %>% filter(Sequel == "Yes" & Opening > 10000 & Opening < 15000 )
# Rank                                     Movie  Opening    Gross   Genre Sequel
# 1   29                    300: Rise of An Empire 12979.38 30538.70  Action    Yes
# 2   37                        Dumb and Dumber To 11449.52 27041.41  Comedy    Yes
# 3   17                How to Train Your Dragon 2 11627.40 41472.10    Kids    Yes
# 4    6 The Hobbit: The Battle of the Five Armies 14122.41 65836.54 Fantasy    Yes
# 5   47                        The Purge: Anarchy 10629.83 25197.06  Horror    Yes
# 6   49                      Think Like a Man Too 13142.43 29295.36  Comedy    Yes

# Q2
Q2 = C3 %>% group_by(Genre) %>% 
  summarise(AverageRank = mean(Rank), NumberOfMovies = n() ) %>% 
  arrange(desc(AverageRank))
# Genre AverageRank NumberOfMovies
# (fctr)       (dbl)          (int)
# 1    Horror    44.00000              2
# 2    Comedy    31.85714              7
# 3     Drama    31.33333              6
# 4    Action    30.70000             10
# 5   Musical    30.50000              2
# 6      Kids    27.88889              9
# 7   Fantasy    21.33333              3
# 8     SciFi    18.71429              7
# 9 Superhero     7.00000              4

# Q3
Q3 = C3 %>% group_by(Genre) %>% 
  summarise(AverageRank = mean(Rank), NumberOfMovies = n(), SequelProportion = round(sum(Sequel == "Yes")/n(),2) ) %>% 
  arrange(desc(AverageRank))

answerQ3 = Q3 %>% select(1,4)

# Q3
# Genre AverageRank NumberOfMovies SequelProportion
# (fctr)       (dbl)          (int)            (dbl)
# 1    Horror    44.00000              2             0.50
# 2    Comedy    31.85714              7             0.43
# 3     Drama    31.33333              6             0.00
# 4    Action    30.70000             10             0.20
# 5   Musical    30.50000              2             0.00
# 6      Kids    27.88889              9             0.44
# 7   Fantasy    21.33333              3             0.33
# 8     SciFi    18.71429              7             0.29
# 9 Superhero     7.00000              4             0.75

# answerQ3
# Genre SequelProportion
# (fctr)            (dbl)
# 1    Horror             0.50
# 2    Comedy             0.43
# 3     Drama             0.00
# 4    Action             0.20
# 5   Musical             0.00
# 6      Kids             0.44
# 7   Fantasy             0.33
# 8     SciFi             0.29
# 9 Superhero             0.75


