rm(list = ls())
library(tidyverse)
library(nycflights13)

#?flights

flights
f <- flights
#data("flights")

#In this chapter you are going to learn the five key dplyr functions that allow you to solve the vast majority of your data manipulation challenges:
  #Pick observations by their values (filter()).
  #Reorder the rows (arrange()).
  #Pick variables by their names (select()).
  #Create new variables with functions of existing variables (mutate()).
  #Collapse many values down to a single summary (summarise()).

#FILTER():---------------------------------------

filter(flights, month == 1, day == 1)
(dec25 <- filter(flights,month == 12, day == 25)) # putting () around an assignment prints the df as well.

sqrt(2)^2 == 2
near(sqrt(2)^2,2)

flights %>% filter(month == 11 | month == 12)

flights %>% filter(month %in% c(11,12))

#exercises of filter:
nrow(filter(f,f$arr_delay > 120))

nrow(filter(f,dest %in% c("IAH","HOU")))

nrow(filter(f, arr_delay >= 120 & dep_delay <= 0))

nrow(filter(f, between(hour,0,6)))




