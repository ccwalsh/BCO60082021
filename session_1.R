library(tidyverse)
library(tidymodels)
library(lubridate)
library(skimr)
library(janitor)

olympics<-read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-27/olympics.csv')
 head(olympics)

 summary(olympics) 
 skim(olympics) 
 
 olympics %>% count(season)
 olympics %>% count(city)

 olympics %>% count(medal, sort = TRUE)

judo<- olympics %>% 
   filter(sport == "Judo") %>% 
  drop_na(weight) %>% 
  mutate( ave_weight = ave(weight))


judo %>% 
  #filter(year == 2000) %>% 
  drop_na(medal) %>% 
  ggplot(aes(weight))+geom_histogram()

 