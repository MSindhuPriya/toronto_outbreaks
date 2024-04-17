#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
# [...ADD CODE HERE...]
outbreak_simulation <-
  tibble(
    setting = rep(x = c("Hospital", "Care Facility", "Clinic", "School", "Other"), times = 10),
    year = rep(x = 2020:2024, times = 10),
    deaths = rnbinom(n = 50, size = 20, prob = 0.1)
  )

outbreak_simulation



