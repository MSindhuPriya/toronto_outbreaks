#### Preamble ####
# Purpose: Downloads and saves the data from the `opendatatoronto` package
# Author: Sindhu Priya Mallavarapu
# Date: 1 April 2024
# Contact: sindhupriya.mallavarapu@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(lintr)

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]

#find package
pack <- show_package("outbreaks-in-toronto-healthcare-institutions")
pack

# check resources to find which rows we need to download 
resources <- list_package_resources("outbreaks-in-toronto-healthcare-institutions")
resources

# download the data
ob_data_2024 <- get_resource(filter(resources, row_number()==1))
ob_data_2024

ob_data_2023 <- get_resource(filter(resources, row_number()==2))
ob_data_2023

ob_data_2022 <- get_resource(filter(resources, row_number()==3))
ob_data_2022

ob_data_2021 <- get_resource(filter(resources, row_number()==4))
ob_data_2021

ob_data_2020 <- get_resource(filter(resources, row_number()==5))
ob_data_2020
#### Save data ####

# save all the data into separate files
write_csv(ob_data_2024, "inputs/data/2024_outbreak_data.csv") 

write_csv(ob_data_2023, "inputs/data/2023_outbreak_data.csv") 

write_csv(ob_data_2022, "inputs/data/2022_outbreak_data.csv") 

write_csv(ob_data_2021, "inputs/data/2021_outbreak_data.csv") 

write_csv(ob_data_2020, "inputs/data/2020_outbreak_data.csv") 

         
