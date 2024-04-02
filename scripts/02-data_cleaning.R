#### Preamble ####
# Purpose: Cleans and merges the outbreak data
# Author: Sindhu Priya Mallavarapu
# Date: 1 April 2024
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(arrow)

#### Clean data ####

# Load in data and add in columns to count various variables
ob_data_2024 <- read_csv("inputs/data/2024_outbreak_data.csv", show_col_types = FALSE) 
ob_data_2024 <- ob_data_2024 |> clean_names() |> add_count(outbreak_setting, name = "setting_count")
ob_data_2024 <- ob_data_2024 |> add_count(type_of_outbreak, name = "type_count")
ob_data_2024$outbreak_year <- format(as.Date(ob_data_2024$date_outbreak_began), "%Y")
ob_data_2024 <- ob_data_2024 |> add_count(outbreak_year, name = "year_count")

ob_data_2023 <- read_csv("inputs/data/2023_outbreak_data.csv", show_col_types = FALSE) 
ob_data_2023 <- ob_data_2023 |> clean_names() |> add_count(outbreak_setting, name = "setting_count")
ob_data_2023 <- ob_data_2023 |> add_count(type_of_outbreak, name = "type_count")
ob_data_2023$outbreak_year <- format(as.Date(ob_data_2023$date_outbreak_began), "%Y")
ob_data_2023 <- ob_data_2023 |> add_count(outbreak_year, name = "year_count")

ob_data_2022 <- read_csv("inputs/data/2022_outbreak_data.csv", show_col_types = FALSE) 
ob_data_2022 <- ob_data_2022 |> clean_names() |> add_count(outbreak_setting, name = "setting_count")
ob_data_2022 <- ob_data_2022 |> add_count(type_of_outbreak, name = "type_count")
ob_data_2022$outbreak_year <- format(as.Date(ob_data_2022$date_outbreak_began), "%Y")
ob_data_2022 <- ob_data_2022 |> add_count(outbreak_year, name = "year_count")

ob_data_2021 <- read_csv("inputs/data/2021_outbreak_data.csv", show_col_types = FALSE) 
ob_data_2021 <- ob_data_2021 |> clean_names() |> add_count(outbreak_setting, name = "setting_count")
ob_data_2021 <- ob_data_2021 |> add_count(type_of_outbreak, name = "type_count")
ob_data_2021$outbreak_year <- format(as.Date(ob_data_2021$date_outbreak_began), "%Y")
ob_data_2021 <- ob_data_2021 |> add_count(outbreak_year, name = "year_count")

ob_data_2020 <- read_csv("inputs/data/2020_outbreak_data.csv", show_col_types = FALSE) 
ob_data_2020 <- ob_data_2020 |> clean_names() |> add_count(outbreak_setting, name = "setting_count")
ob_data_2020 <- ob_data_2020 |> add_count(type_of_outbreak, name = "type_count")
ob_data_2020$outbreak_year <- format(as.Date(ob_data_2020$date_outbreak_began), "%Y")
ob_data_2020 <- ob_data_2020 |> add_count(outbreak_year, name = "year_count")

# Make sure column names are consistent
colnames(ob_data_2020) <- colnames(ob_data_2024)

# Merge data into one file
merge1 <- merge(ob_data_2024, ob_data_2023, all = TRUE)
merge2 <- merge(merge1, ob_data_2022, all = TRUE)
merge3 <- merge(merge2, ob_data_2021, all = TRUE)
clean_data <- merge(merge3, ob_data_2020, all = TRUE)

# Plot the annual outbreak data by setting
pl <- clean_data |>
  ggplot(aes(x = outbreak_year, y = setting_count, color = outbreak_setting)) +
  geom_point() + geom_line() +
  theme_minimal() +
  labs(x = "Year", y = "Annual outbreaks in Toronto") +
  facet_wrap(vars(outbreak_setting), dir = "v", ncol = 1) +
  theme(legend.position = "none")
pl

#### Save data ####
write.csv(clean_data, "outputs/data/clean_data.csv")
write_parquet(clean_data, "outputs/data/clean_data.parquet")
