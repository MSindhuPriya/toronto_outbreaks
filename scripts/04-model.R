#### Preamble ####
# Purpose: Models outbreak trends in Toronto
# Author: Sindhu Priya Mallavarapu
# Date: 1 April 2024
# Contact: sindhupriya.malalvarapu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
analysis_data <- read_parquet("outputs/data/analysis_data.parquet")

### Model data ####

# Build a poisson model
first_model <-
  stan_glm(
    formula = setting_count ~ outbreak_setting + outbreak_year,
    data = analysis_data,
    family = poisson(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

# Build a negative binomial model
second_model <-
  stan_glm(
    formula = setting_count ~ outbreak_setting,
    data = analysis_data,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "outputs/models/first_model.rds"
)

saveRDS(
  second_model,
  file = "outputs/models/second_model.rds"
)


