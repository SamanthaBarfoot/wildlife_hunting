#### Preamble ####
# Purpose: Tests data for values containing extra zeros and letters as well as
# making sure the data is within a reasonable range (no bad data). Additionally,
# it checks that "total" values are correct when adding up other values
# Author: Samantha Barfoot
# Date: 28 March 2024
# Contact: samantha.barfoot@mail.utoronto.ca
# License: MIT
# Pre-requisites: download data sets from the Ontario Data Catalogue
# and run 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(lintr)

#### Read in data ####

north_bear <-
  read_csv(
    file = "./data/analysis_data/north_data_bear.csv",
    show_col_types = FALSE
  )

se_bear <-
  read_csv(
    file = "./data/analysis_data/southeast_data_bear.csv",
    show_col_types = FALSE
  )

sw_bear <-
  read_csv(
    file = "./data/analysis_data/southwest_data_bear.csv",
    show_col_types = FALSE
  )

north_moose <-
  read_csv(
    file = "./data/analysis_data/north_data_moose.csv",
    show_col_types = FALSE
  )

se_moose <-
  read_csv(
    file = "./data/analysis_data/southeast_data_moose.csv",
    show_col_types = FALSE
  )

sw_moose <-
  read_csv(
    file = "./data/analysis_data/southwest_data_moose.csv",
    show_col_types = FALSE
  )

all_moose <-
  read_csv(
    file = "./data/analysis_data/all_data_moose.csv",
    show_col_types = FALSE
  )

all_bear <-
  read_csv(
    file = "./data/analysis_data/all_data_bear.csv",
    show_col_types = FALSE
  )

types_moose <-
  read_csv(
    file = "./data/analysis_data/types_data_moose.csv",
    show_col_types = FALSE
  )

#### Test data ####

#TEST 1: Check that the WMU values do not end in letters, only numbers
for (i in seq_along(all_moose$WMU)) {
  if (str_ends(all_moose$WMU[i], "[A-Za-z]")) {
    print(paste("all_moose: WMU includes letter: ", all_moose$WMU[i]))
  }
}

for (i in seq_along(all_bear$WMU)) {
  if (str_ends(all_bear$WMU[i], "[A-Za-z]")) {
    print(paste("all_bear: WMU includes letter: ", all_bear$WMU[i]))
  }
}

#TEST 2: Checks that there are no duplicate years
for (i in seq_along(north_bear$Year)) {
  if (duplicated(north_bear$Year)[i] == TRUE) {
    print("north_bear: duplicate year found: ", north_bear$Year[i])
  }
}

for (i in seq_along(se_bear$Year)) {
  if (duplicated(se_bear$Year)[i] == TRUE) {
    print("se_bear: duplicate year found: ", se_bear$Year[i])
  }
}

for (i in seq_along(sw_bear$Year)) {
  if (duplicated(sw_bear$Year)[i] == TRUE) {
    print("sw_bear: duplicate year found: ", sw_bear$Year[i])
  }
}

for (i in seq_along(north_moose$Year)) {
  if (duplicated(north_moose$Year)[i] == TRUE) {
    print("north_moose: duplicate year found: ", north_moose$Year[i])
  }
}

for (i in seq_along(se_moose$Year)) {
  if (duplicated(se_moose$Year)[i] == TRUE) {
    print("se_moose: duplicate year found: ", se_moose$Year[i])
  }
}

for (i in seq_along(sw_moose$Year)) {
  if (duplicated(sw_moose$Year)[i] == TRUE) {
    print("sw_moose: duplicate year found: ", sw_moose$Year[i])
  }
}

for (i in seq_along(types_moose$Year)) {
  if (duplicated(types_moose$Year)[i] == TRUE) {
    print("types_moose: duplicate year found: ", types_moose$Year[i])
  }
}

#TEST 3: Checks that the bull, cow, and calf harvests all add up to
# the total harvest value

for (i in seq_along(north_moose$`Total Harvest`)) {
  if (north_moose$`Bull Harvest`[i]
      + north_moose$`Cow Harvest`[i]
      + north_moose$`Calf Harvest`[i]
      != north_moose$`Total Harvest`[i]) {
    print("north_moose: The sum of the Bull, Cow, and Calf harvests do not add 
          up to the Total Harvest")
  }
}

for (i in seq_along(se_moose$`Total Harvest`)) {
  if (se_moose$`Bull Harvest`[i]
      + se_moose$`Cow Harvest`[i]
      + se_moose$`Calf Harvest`[i]
      != se_moose$`Total Harvest`[i]) {
    print("se_moose: The sum of the Bull, Cow, and Calf harvests do not add 
          up to the Total Harvest")
  }
}

for (i in seq_along(sw_moose$`Total Harvest`)) {
  if (sw_moose$`Bull Harvest`[i]
      + sw_moose$`Cow Harvest`[i]
      + sw_moose$`Calf Harvest`[i]
      != sw_moose$`Total Harvest`[i]) {
    print("sw_moose: The sum of the Bull, Cow, and Calf harvests do not add 
          up to the Total Harvest")
  }
}

#TEST 4: Checks that harvest numbers are within a reasonable range
# the reasonable range is 0 to 200,000 as there cannot be a negative number
# of harvests and the harvest cannot exceed the species population

for (i in seq_along(north_bear)){
  if (north_bear$Harvest[i] < 0 && north_bear$Harvest[i] > 100000) {
    print("north_bear: Harvest number not in reasonable range (bad data)")
  }
}

for (i in seq_along(se_bear)){
  if (se_bear$Harvest[i] < 0 && se_bear$Harvest[i] > 100000) {
    print("se_bear: Harvest number not in reasonable range (bad data)")
  }
}

for (i in seq_along(sw_bear)){
  if (sw_bear$Harvest[i] < 0 && sw_bear$Harvest[i] > 100000) {
    print("sw_bear: Harvest number not in reasonable range (bad data)")
  }
}

for (i in seq_along(north_moose)){
  if (north_moose$`Total Harvest`[i] < 0
      && north_moose$`Total Harvest`[i] > 100000) {
    print("north_moose: Harvest number not in reasonable range (bad data)")
  }
}

for (i in seq_along(se_moose)){
  if (se_moose$`Total Harvest`[i] < 0 && se_moose$`Total Harvest`[i] > 100000) {
    print("se_moose: Harvest number not in reasonable range (bad data)")
  }
}

for (i in seq_along(sw_moose)){
  if (sw_moose$`Total Harvest`[i] < 0 && sw_moose$`Total Harvest`[i] > 100000) {
    print("sw_moose: Harvest number not in reasonable range (bad data)")
  }
}

for (i in seq_along(all_moose)){
  if (all_moose$`Total Harvest`[i] < 0
      && all_moose$`Total Harvest`[i] > 100000) {
    print("all_moose: Harvest number not in reasonable range (bad data)")
  }
}

for (i in seq_along(all_bear)){
  if (all_bear$Harvest[i] < 0 && all_bear$Harvest[i] > 100000) {
    print("all_bear: Harvest number not in reasonable range (bad data)")
  }
}

#TEST 5: Checks that WMU doesnt not start with a zero

for (i in seq_along(all_moose$WMU)) {
  if (str_starts(all_moose$WMU[i], "0")) {
    print(paste("all_moose: WMU starts with a zero: ", all_moose$WMU[i]))
  }
}

for (i in seq_along(all_bear$WMU)) {
  if (str_starts(all_bear$WMU[i], "0")) {
    print(paste("all_bear: WMU starts with a zero: ", all_bear$WMU[i]))
  }
}

#Running Lintr
#lintr::lint(filename = "scripts/02-test_data.R")
