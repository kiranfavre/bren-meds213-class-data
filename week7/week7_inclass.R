library(tidyverse)
library(DBI)
library(RSQLite)
library(dplyr)
library(here)

#DBI package has everything that we were using in Python, connects us to database and we can create cursors and queries to interact with the database, using SQLite driver. 
conn <- DBI::dbConnect(RSQLite::SQLite(),
                       here("week7/database.db"))#connection string, where to find database

#make table by feeding our connection and name the table species
species <- tbl(conn, "Species")
#idk why this isnt working lol


#At this point, can use like any dataframe

species %>% 
  filter(Relevance == "study species") %>% 
  select(Scientific_name) %>% 
  arrange(Scientific_name) %>% 
  head(3) %>% 
  show_query() #add show_query() to see what SQL it is sending


#these 'tables' arent actually dataframes though
species <- tbl(conn, "Species")
str(species)
dim(species)


#make a df
local_copy <- species %>% 
                collect() #will turn into a dataframe

str(local_copy)
dim(local_copy)


#can do pretty much anthing w these quasi-tables
species %>% 
  group_by(Relevance) %>% 
  summarize(num_species = n()) %>% 
  show_query()


