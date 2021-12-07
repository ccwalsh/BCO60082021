library(tidyverse)
library(janitor)
library(tidymodels)

#import data
data<- read_csv("https://raw.githubusercontent.com/adashofdata/muffin-cupcake/master/recipes_muffins_cupcakes.csv")

#clean variable names 
data<-data %>% clean_names()

# is the outcome balanced 
data %>% count(type, sort = TRUE)

#lets start modelling
#spilt the data

data_split<-initial_split(data)

data_training<-training(data_split)
data_testing<-testing(data_split)

#data pre proscessing = reciepe

data_recipe<- recipe(type~flour + milk +sugar + butter + egg +baking_powder + vanilla + salt,
                                         data=data_training)


#put steps for data
data_recipe_steps<-data_recipe%>%
  step_meanimpute(all_numeric()) %>%
  step_nzv(all_predictors())

#prep receipe

data_prep<- prep(data_recipe_steps, training=  data_training)

