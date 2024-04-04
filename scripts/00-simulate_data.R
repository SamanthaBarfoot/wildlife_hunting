#### Preamble ####
# Purpose: Simulates the moose, black bear, white tailed deer, wolf and coyote harvest data from the Ontario Data Catalogue
# Author: Samantha Barfoot
# Date: 28 March 2024
# Contact: samantha.barfoot@mail.utoronto.ca
# License: MIT
# Pre-requisites: 

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Simulate data ####
set.seed(1)

#variable that represents the number of columns in the simulated data set
num_samples <- 1700


# Black bear tailed deer simulated data #
#simulated tibble table
simulated_data_bear <-
  tibble(
    # Randomly pick an option, with replacement, 153 times
    "WMU" = c(""),
    "Year" = sample(
      x = 2009:2023,
      size = num_samples,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = num_samples,
      replace = TRUE
    ),
    "Harvest" = sample(
      x = 0:200,
      size = num_samples,
      replace = TRUE
    )
  )

#### SAVE DATA ####

#creates csv file with moose simulated data 
write_csv(
  x = simulated_data_moose,
  file = "data/analysis_data/moose.csv"
)

#creates csv file with black bear simulated data 
write_csv(
  x = simulated_data_moose,
  file = "data/analysis_data/blackBear.csv"
)