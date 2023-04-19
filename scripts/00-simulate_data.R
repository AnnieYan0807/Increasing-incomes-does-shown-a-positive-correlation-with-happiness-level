#### Preamble ####
# Purpose: Simulates Data
# Author: Annie Yan
# Data: 16 April 2023 
# Contact: zixin.yan@mail.utoronto.ca
# License: MIT
# Pre-requisites:None
# Any other information needed?None


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
set.seed(853)

simulated_data <-
  tibble(
    id =
      rpois(
        n = 365 * 3,
        lambda = 10
      ),
    
    income16 = c(
      rep(x = "AVERAGE", times = 365),
      rep(x = "BELOW AVERAGE", times = 365),
      rep(x = "ABOVE AVERAGE", times = 365)
    ),
    
    income = c(
      rep(x = "$15,000 to $19,999", times = 365),
      rep(x = "$20,000 to $24,999", times = 365),
      rep(x = "$25,000 or more", times = 365)
    ),
    
    rincome = c(
      rep(x = "$4000 to 4999", times = 365),
      rep(x = "$5000 to 5999", times = 365),
      rep(x = "$6000 to 6999", times = 365)
    ),
    
    happy = c(
      rep(x = "Not too happy", times = 365),
      rep(x = "Pretty happy", times = 365),
      rep(x = "Very happy", times = 365)
    ),
    
    MentalHealth = c(
      rep(x = "Good", times = 365),
      rep(x = "Stable", times = 365),
      rep(x = "Poor", times = 365)
    )
    
  )


head(simulated_data)



