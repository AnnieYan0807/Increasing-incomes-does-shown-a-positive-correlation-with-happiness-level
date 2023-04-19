####graphs

## Workspace setup
library(tidyverse)
library(reshape2)
library(dplyr)
library(haven)

##read cleaned data
GSS_cleaned_data <- read_csv("Outputs/data/GSS_cleaned_data.csv")

mean_income <- read_csv("Outputs/data/mean_income.csv")
mean_incom16 <- read_csv("Outputs/data/mean_incom16.csv")
mean_rincome <- read_csv("Outputs/data/mean_rincome.csv")

mean_income_2 <- read_csv("Outputs/data/mean_income_2.csv")
mean_incom16_2 <- read_csv("Outputs/data/mean_incom16_2.csv")
mean_rincome_2 <- read_csv("Outputs/data/mean_rincome_2.csv")



## graphing

# Overall Pool
GSS_cleaned_data  |>
  ggplot(mapping = aes(x = happy)) + 
  theme(axis.text.x = element_text(angle = 45,hjust=1)) +
  geom_bar(position = "dodge2")+
  labs(x = "happy", y = "Number of Respondents")

GSS_cleaned_data |>
  ggplot(mapping = aes(x = mntlhlth)) + 
  theme(axis.text.x = element_text(angle = 45,hjust=1)) +
  geom_bar(position = "dodge2")+
  labs(x = "Days of poor mental health past 30 days", y = "Number of Respondents")



# Graph showing relationship between variables and happiness level, 
# using tidyverse-style code to pivot and summarise the data 
mean_income |> 
  mutate(variable = fct_relevel(variable, 
                                "Under $1,000","$1,000 to $2,999", "$3,000 to $3,999", "$4,000 to $4,999", 
                                "$5,000 to $5,999", "$6,000 to $6,999", "$7,000 to $7,999", 
                                "$8,000 to $9,999", "$10,000 to $14,999","$15,000 to $19,999",
                                "$20,000 to $24,999","$25,000 or more")) %>%
  ggplot(aes(x = variable, y = value)) + 
  geom_point() +
  theme(axis.text.x = element_text(angle = 45,hjust=1), 
        axis.line = element_line(colour = "black"),
        title = element_text(size = 12)) +
  labs(
    x = "Income",
    y = "Happiness level"
  )

mean_incom16 |> 
  mutate(variable = fct_relevel(variable, 
                                "FAR BELOW AVERAGE","BELOW AVERAGE", "AVERAGE",  
                                "ABOVE AVERAGE", "FAR ABOVE AVERAGE")) %>%
  ggplot(aes(x = variable, y = value)) + 
  geom_point() +
  theme(axis.text.x = element_text(angle = 45,hjust=1), 
        axis.line = element_line(colour = "black"),
        title = element_text(size = 12)) +
  labs(
    x = "Family income when 16 yrs old",
    y = "Happiness level"
  )

mean_rincome |> 
  mutate(variable = fct_relevel(variable, 
                                "LT $1000","$1000 TO 2999", "$3000 TO 3999", "$4000 TO 4999", 
                                "$5000 TO 5999", "$6000 TO 6999", "$7000 TO 7999", 
                                "$8000 TO 9999", "$10000 - 14999","$15000 - 19999",
                                "$20000 - 24999", "$25000 OR MORE")) %>%
  ggplot(aes(x = variable, y = value)) + 
  geom_point() +
  theme(axis.text.x = element_text(angle = 45,hjust=1), 
        axis.line = element_line(colour = "black"),
        title = element_text(size = 12)) +
  labs(
    x = "Personal Income",
    y = "Happiness level"
  )

# Graph showing relationship between variables and days of poor mental health past 30 days, 
# using tidyverse-style code to pivot and summarise the data 

mean_income_2 |> 
  mutate(variable = fct_relevel(variable, 
                                "Under $1,000","$1,000 to $2,999", "$3,000 to $3,999", "$4,000 to $4,999", 
                                "$5,000 to $5,999", "$6,000 to $6,999", "$7,000 to $7,999", 
                                "$8,000 to $9,999", "$10,000 to $14,999","$15,000 to $19,999",
                                "$20,000 to $24,999","$25,000 or more")) %>%
  ggplot(aes(x = variable, y = value)) + 
  geom_point() +
  theme(axis.text.x = element_text(angle = 45,hjust=1), 
        axis.line = element_line(colour = "black"),
        title = element_text(size = 12)) +
  labs(
    x = "Income",
    y = "Days of poor mental health past 30 days"
  )

mean_incom16_2 |> 
  mutate(variable = fct_relevel(variable, 
                                "FAR BELOW AVERAGE","BELOW AVERAGE", "AVERAGE",  
                                "ABOVE AVERAGE", "FAR ABOVE AVERAGE")) %>%
  ggplot(aes(x = variable, y = value)) + 
  geom_point() +
  theme(axis.text.x = element_text(angle = 45,hjust=1), 
        axis.line = element_line(colour = "black"),
        title = element_text(size = 12)) +
  labs(
    x = "Family income when 16 yrs old",
    y = "Days of poor mental health past 30 days"
  )

mean_rincome_2 |> 
  mutate(variable = fct_relevel(variable, 
                                "LT $1000","$1000 TO 2999", "$3000 TO 3999", "$4000 TO 4999", 
                                "$5000 TO 5999", "$6000 TO 6999", "$7000 TO 7999", 
                                "$8000 TO 9999", "$10000 - 14999","$15000 - 19999",
                                "$20000 - 24999", "$25000 OR MORE")) %>%
  ggplot(aes(x = variable, y = value)) + 
  geom_point() +
  theme(axis.text.x = element_text(angle = 45,hjust=1), 
        axis.line = element_line(colour = "black"),
        title = element_text(size = 12)) +
  labs(
    x = "Personal Income",
    y = "Days of poor mental health past 30 days"
  )