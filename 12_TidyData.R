rm(list = ls())
library(tidyverse)
data("who")

who1 <- who %>% pivot_longer(cols = new_sp_m014:newrel_f65, 
                             names_to = "key", 
                             values_to = "cases", 
                             values_drop_na = TRUE)
who1 %>% count(key)
who2 <- who1 %>% mutate(key = stringr::str_replace(key,"newrel","new_rel"))
who3 <- who2 %>% separate(key,c("new","type","sexage"),sep = "_")
who3 %>% count(new)
who4 <- who3 %>% select(-new, -iso2, -iso3)
who5 <- who4 %>% separate(sexage, c("sex","age"),sep = 1)

who6 <- who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE
  ) %>% 
  mutate(
    key = stringr::str_replace(key, "newrel", "new_rel")
  ) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)

x <- c("apple","banana","pear")
str_view(x,"a$")
