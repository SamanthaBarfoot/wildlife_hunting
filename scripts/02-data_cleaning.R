#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Samantha Barfoot
# Date: 28 March 2024
# Contact: samantha.barfoot@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# Any other information needed?

#### Workspace setup ####
library(tidyverse)
library(MASS)
library(stringr)

#### Read in data ####
raw_data_moose <- read_csv("data/raw_data/moose_2023.csv",
                          show_col_types = FALSE,
                          skip = 1)

#raw_data_bear <- read_csv("data/raw_data/black_bear_2023.csv",
#                          show_col_types = FALSE,
#                          skip = 1)

#### Clean in data ####
num_records_moose <- dim(raw_data_moose)[1]

#creates matrix full of zeros to store clean data
moose_data <- matrix(rep(0, 7*36), ncol = 7, nrow = 36)

#fills clean data matrix with the cleaned data
#columns are as follows: wildlife management region, year, active hunters, bull harvest,
# cow harvest, calf harvest, and total harvest
for(i in 1:num_records_moose){
  #unit <- raw_data_moose[[i,1]]
  unit <- "075"
  if(str_starts(unit,"0")){
    str_remove(unit,"0")
  }
  if(str_ends(unit,"[A-Za-z]")){
    str_remove(unit,"[A-Za-z]")
  }
  unit <- strtoi(unit)
  print(unit)
}


#### Save data ####
#write_csv(cleaned_data, "/data/analysis_data/")
