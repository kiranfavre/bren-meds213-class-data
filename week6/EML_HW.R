#Load libraries
library(EML)
library(emld)

# Starting our EML Record
# Describing the Coverage (Temporal and Geographic)

geographicDescription <- "global"

coverage <- 
  set_coverage(begin = "2019", end = "2023",
               geographicDescription = geographicDescription,
               west = -180, east = 180, 
               north = 90, south = -90)

#Methods ---- should we make a file describing the methods of our own capstone?
methods_file <- "./week6/methods.md"
methods <- set_methods(methods_file)

#creator of dataset.. so would be silvia?
lospacio <- eml$creator(
  individualName = eml$individualName(
    givenName = "Gianalberto", #first name
    surName = "Losapio"), #last name
  electronicMailAddress = "losapiog@stanford.edu")
