#### Preamble ####
# Purpose: Test Data
# Author: Annie Yan
# Data: 16 April 2023 
# Contact: zixin.yan@mail.utoronto.ca
# License: MIT
# Pre-requisites:None
# Any other information needed?None


#### Workspace setup ####
library(tidyverse)
simulate_data <- read.csv(here::here("Outputs/data/simulated_data.csv"))

#### Test data ####
simulate_data$id |> class() == "integer"
simulate_data$rincome |> class() == "character"
simulate_data$income |> class() == "character"
