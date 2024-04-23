#### Preamble ####
# Purpose: Cleans the raw data files obtained from the Ontario Data Catalogue
# Author: Samantha Barfoot
# Date: 28 March 2024
# Contact: samantha.barfoot@mail.utoronto.ca
# License: MIT
# Pre-requisites: download data from Ontario Data Catalogue and
# add to data/raw_data

#### Workspace setup ####
library(tidyverse)
library(MASS)
library(stringr)
library(dplyr)
library(arrow)
library(lintr)

#### Read in data ####
raw_data_moose <- read_csv("data/raw_data/moose_2023.csv",
                           show_col_types = FALSE)

raw_data_bear <- read_csv("data/raw_data/black_bear_2023.csv",
                          show_col_types = FALSE)

#### Clean in data ####
num_records_moose <- dim(raw_data_moose)[1]
num_records_bear <- dim(raw_data_bear)[1]

#cleans WMU names so that there are no letters or beginning zeros for moose
for (i in 1:num_records_moose){
  unit <- raw_data_moose[[i, 1]]
  #Checks if the wmu value has a zero at the start or a letter at the
  # end of the string and removes them
  if (str_starts(unit, "0")) {
    unit <- str_remove(unit, "0")
  }
  if (str_ends(unit, "[A-Za-z]")) {
    unit <- str_remove(unit, "[A-Za-z]")
  }
  raw_data_moose[[i, 1]] <- unit
}

#cleans WMU names so that there are no letters or beginning zeros  for bears
for (i in 1:num_records_bear){
  unit <- raw_data_bear[[i, 1]]
  #Checks if the wmu value has a zero at the start or a letter at the end of the
  # string and removes them
  if (str_starts(unit, "0")) {
    unit <- str_remove(unit, "0")
  }
  if (str_ends(unit, "[A-Za-z]")) {
    unit <- str_remove(unit, "[A-Za-z]")
  }
  raw_data_bear[[i, 1]] <- unit
}

## Moose tibbles ##
#creates a tibble of the north region moose data by year
north_data_moose <-
  raw_data_moose |>
  filter(WMU >= 1 & WMU <= 45) |>
  group_by(Year) |>
  summarise(`Active Hunters` = sum(`Active Hunters`),
            `Bull Harvest` = sum(`Bull Harvest`),
            `Cow Harvest` = sum(`Cow Harvest`),
            `Calf Harvest` = sum(`Calf Harvest`),
            `Total Harvest` = sum(`Total Harvest`))

#creates a tibble of the southeast region moose data by year
southeast_data_moose <-
  raw_data_moose |>
  filter(WMU >= 46 & WMU <= 78) |>
  group_by(Year) |>
  summarise(`Active Hunters` = sum(`Active Hunters`),
            `Bull Harvest` = sum(`Bull Harvest`),
            `Cow Harvest` = sum(`Cow Harvest`),
            `Calf Harvest` = sum(`Calf Harvest`),
            `Total Harvest` = sum(`Total Harvest`))

#creates a tibble of the southwest region moose data by year
southwest_data_moose <-
  raw_data_moose |>
  filter(WMU >= 79 & WMU <= 95) |>
  group_by(Year) |>
  summarise(`Active Hunters` = sum(`Active Hunters`),
            `Bull Harvest` = sum(`Bull Harvest`),
            `Cow Harvest` = sum(`Cow Harvest`),
            `Calf Harvest` = sum(`Calf Harvest`),
            `Total Harvest` = sum(`Total Harvest`))

#Creates a tibble of all the bull, calf, and cow harvests over the years from
# all regions
types_data_moose <-
  raw_data_moose |>
  group_by(Year) |>
  summarise(`Bull Harvest` = sum(`Bull Harvest`),
            `Cow Harvest` = sum(`Cow Harvest`),
            `Calf Harvest` = sum(`Calf Harvest`))

#creates a tibble of all moose WMU data, not grouped by year
all_data_moose <-
  raw_data_moose |>
  filter(WMU >= 1 & WMU <= 95)

## Bear tibbles ##
#creates a tibble of the north region bear data by year
north_data_bear <-
  raw_data_bear |>
  filter(WMU >= 1 & WMU <= 45) |>
  group_by(Year) |>
  summarise(`Active Hunters` = sum(`Active Hunters`),
            Harvest = sum(Harvest))

#creates a tibble of the southeast region bear data by year
southeast_data_bear <-
  raw_data_bear |>
  filter(WMU >= 46 & WMU <= 78) |>
  group_by(Year) |>
  summarise(`Active Hunters` = sum(`Active Hunters`),
            Harvest = sum(Harvest))

#creates a tibble of the southwest region bear data by year
southwest_data_bear <-
  raw_data_bear |>
  filter(WMU >= 79 & WMU <= 95) |>
  group_by(Year) |>
  summarise(`Active Hunters` = sum(`Active Hunters`),
            Harvest = sum(Harvest))

#creates a tibble of all bear WMU data, not grouped by year
all_data_bear <-
  raw_data_bear |>
  filter(WMU >= 1 & WMU <= 95)

#### SAVE DATA ####

all_data_bear$WMU <- as.double(all_data_bear$WMU)
all_data_moose$WMU <- as.double(all_data_moose$WMU)

write_parquet(
  x = north_data_moose,
  sink = "data/analysis_data/north_data_moose.parquet"
)

write_parquet(
  x = southeast_data_moose,
  sink = "data/analysis_data/southeast_data_moose.parquet"
)

write_parquet(
  x = southwest_data_moose,
  sink = "data/analysis_data/southwest_data_moose.parquet"
)

write_parquet(
  x = all_data_moose,
  sink = "data/analysis_data/all_data_moose.parquet"
)

write_parquet(
  x = types_data_moose,
  sink = "data/analysis_data/types_data_moose.parquet"
)

write_parquet(
  x = north_data_bear,
  sink = "data/analysis_data/north_data_bear.parquet"
)

write_parquet(
  x = southeast_data_bear,
  sink = "data/analysis_data/southeast_data_bear.parquet"
)

write_parquet(
  x = southwest_data_bear,
  sink = "data/analysis_data/southwest_data_bear.parquet"
)

write_parquet(
  x = all_data_bear,
  sink = "data/analysis_data/all_data_bear.parquet"
)

#Running Lintr
#lintr::lint(filename = "scripts/01-data_cleaning.R")