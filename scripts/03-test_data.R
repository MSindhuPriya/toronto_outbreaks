#### Preamble ####
# Purpose: Tests analysis data
# Author: Sindhu Priya Mallavarapu
# Date: 18 April, 2024
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

#### Test data ####
test_data <- read.csv("outputs/data/analysis_data.csv")

# make sure that we cleaned the data properly so that setting count is an integer
test_data$setting_count |> class() == 'integer'

# make sure we cleaned the data properly so that the type count is an integer
test_data$type_count |> class() == 'integer'

# make sure we cleaned the data properly so that the year count is an integer
test_data$year_count |> class() == 'integer'

# make sure we cleaned the data properly so that the outbreak year is an Date
test_data$outbreak_year |> class() == 'integer'

# make sure the data we're using is from 2020 to 2024
test_data$outbreak_year |> min() >= 2020
test_data$outbreak_year |> max() <= 2024
