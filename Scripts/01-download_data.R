#### Preamble ####
# Purpose: Downloads and saves the data from GSS
# Author: Annie Yan
# Data: 16 April 2023 
# Contact: zixin.yan@mail.utoronto.ca
# License: MIT
# Pre-requisites:None
# Any other information needed?None


#### Workspace setup ####
library(readxl)
library(tidyverse)
library(haven)

#### Download data ####
GSS_raw_data <- read_excel(here::here("Inputs/data/GSS.xlsx"))


#### Save data ####
# [...UPDATE THIS...]
write_csv(GSS_raw_data, "Inputs/data/GSS_raw_data.csv") 

         