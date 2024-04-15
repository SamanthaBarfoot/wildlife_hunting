#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Samantha Barfoot
# Date: 28 March 2024
# Contact: samantha.barfoot@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# Any other information needed?


#### Workspace setup ####
library(tidyverse)
library(stringr)

#### Download data ####

unit <- "75A"
if(str_ends(unit,"[A-Za-z]")){
  unit <- str_remove(unit,"[A-Za-z]")
}
unit <- strtoi(unit)
print(unit)

#### Save data ####
