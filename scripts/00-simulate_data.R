#### Preamble ####
# Purpose: Simulates the moose and black bear data sets from
# the Ontario Data Catalogue
# Author: Samantha Barfoot
# Date: 28 March 2024
# Contact: samantha.barfoot@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Simulate data ####
set.seed(1)

# Black bear simulated data
#simulated tibble tables
# Random values are generated for each column that is within a reasonable range
north_data_bear <-
  tibble(
    "Year" = sample(
      x = 2012:2023,
      size = 12,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = 12,
      replace = TRUE
    ),
    "Harvest" = sample(
      x = 0:200,
      size = 12,
      replace = TRUE
    )
  )

se_data_bear <-
  tibble(
    "Year" = sample(
      x = 2012:2023,
      size = 12,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = 12,
      replace = TRUE
    ),
    "Harvest" = sample(
      x = 0:200,
      size = 12,
      replace = TRUE
    )
  )

sw_data_bear <-
  tibble(
    "Year" = sample(
      x = 2012:2023,
      size = 12,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = 12,
      replace = TRUE
    ),
    "Harvest" = sample(
      x = 0:200,
      size = 12,
      replace = TRUE
    )
  )

all_data_bear <-
  tibble(
    "WMU" = sample(
      x = 1:95,
      size = 1056,
      replace = TRUE
    ),
    "Year" = sample(
      x = 2012:2023,
      size = 1056,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = 1056,
      replace = TRUE
    ),
    "Harvest" = sample(
      x = 0:200,
      size = 1056,
      replace = TRUE
    )
  )

# Moose simulated data
#simulated tibble tables
# Random values are generated for each column that is within a reasonable range
north_data_moose <-
  tibble(
    "Year" = sample(
      x = 2012:2023,
      size = 18,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = 18,
      replace = TRUE
    ),
    "Bull Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Cow Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Calf Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Total Harvest" = sample(
      x = 0:800,
      size = 18,
      replace = TRUE
    )
  )

se_data_moose <-
  tibble(
    "Year" = sample(
      x = 2012:2023,
      size = 18,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = 18,
      replace = TRUE
    ),
    "Bull Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Cow Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Calf Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Total Harvest" = sample(
      x = 0:800,
      size = 18,
      replace = TRUE
    )
  )

sw_data_moose <-
  tibble(
    "Year" = sample(
      x = 2012:2023,
      size = 18,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = 18,
      replace = TRUE
    ),
    "Bull Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Cow Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Calf Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Total Harvest" = sample(
      x = 0:800,
      size = 18,
      replace = TRUE
    )
  )

types_data_moose <-
  tibble(
    "Year" = sample(
      x = 2012:2023,
      size = 18,
      replace = TRUE
    ),
    "Bull Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Cow Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    ),
    "Calf Harvest" = sample(
      x = 0:200,
      size = 18,
      replace = TRUE
    )
  )

all_data_moose <-
  tibble(
    "WMU" = sample(
      x = 1:95,
      size = 1229,
      replace = TRUE
    ),
    "Year" = sample(
      x = 2012:2023,
      size = 1229,
      replace = TRUE
    ),
    "Active Hunters" = sample(
      x = 0:500,
      size = 1229,
      replace = TRUE
    ),
    "Bull Harvest" = sample(
      x = 0:200,
      size = 1229,
      replace = TRUE
    ),
    "Cow Harvest" = sample(
      x = 0:200,
      size = 1229,
      replace = TRUE
    ),
    "Calf Harvest" = sample(
      x = 0:200,
      size = 1229,
      replace = TRUE
    ),
    "Total Harvest" = sample(
      x = 0:800,
      size = 1229,
      replace = TRUE
    )
  )

#### SAVE DATA ####

write_parquet(
  x = north_data_bear,
  sink = "outputs/analysis_data/north_data_bear.parquet"
)

write_parquet(
  x = se_data_bear,
  sink = "outputs/analysis_data/southeast_data_bear.parquet"
)

write_parquet(
  x = sw_data_bear,
  sink = "outputs/analysis_data/southwest_data_bear.parquet"
)

write_parquet(
  x = north_data_moose,
  sink = "outputs/analysis_data/north_data_moose.parquet"
)

write_parquet(
  x = se_data_moose,
  sink = "outputs/analysis_data/southeast_data_moose.parquet"
)

write_parquet(
  x = sw_data_moose,
  sink = "outputs/analysis_data/southwest_data_moose.parquet"
)

write_parquet(
  x = types_data_moose,
  sink = "outputs/analysis_data/types_data_moose.parquet"
)

write_parquet(
  x = all_data_bear,
  sink = "outputs/analysis_data/all_data_bear.parquet"
)

write_parquet(
  x = all_data_moose,
  sink = "outputs/analysis_data/all_data_moose.parquet"
)

#Running Lintr
#lintr::lint(filename = "scripts/00-simulate_data.R")
