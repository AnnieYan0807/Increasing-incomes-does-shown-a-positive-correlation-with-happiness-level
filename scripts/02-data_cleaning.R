#### Preamble ####
# Purpose: Cleans.... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Data: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(reshape2)
library(dplyr)
library(haven)



#### Clean data ####
GSS_data <- read_csv("Inputs/data/GSS_raw_data.csv")







###Clean overall dataset
## Change responds in happiness level into numbers
GSS_data$happy [GSS_data$happy == 'Not too happy'] <- 1
GSS_data$happy [GSS_data$happy == 'Pretty happy'] <- 2
GSS_data$happy [GSS_data$happy == 'Very happy'] <- 3
GSS_data$happy [GSS_data$happy == '.i:  Inapplicable'] <- 0
GSS_data$happy [GSS_data$happy == '.n:  No answer'] <- 0
GSS_data$happy [GSS_data$happy == '.s:  Skipped on Web'] <- 0
GSS_data$happy [GSS_data$happy == '	.d:  Do not Know/Cannot Choose'] <- 0
GSS_data$happy = as.numeric(GSS_data$happy)

## Delete not applied data (Inapplicable, No answer, Skipped, Do not know)
GSS_data %>% filter(!grepl(0, happy))


## Clean Mental Health data

GSS_data$mntlhlth [GSS_data$mntlhlth == '.i:  Inapplicable'] <- 0
GSS_data$mntlhlth [GSS_data$mntlhlth == '.n:  No answer'] <- 0
GSS_data$mntlhlth[GSS_data$mntlhlth == '.s:  Skipped on Web'] <- 0
GSS_data$mntlhlth[GSS_data$mntlhlth == '	.d:  Do not Know/Cannot Choose'] <- 0
GSS_data$mntlhlth = as.numeric(GSS_data$mntlhlth)

## Delete not applied data (Inapplicable, No answer, Skipped, Do not know)
GSS_data <- GSS_data[!grepl(0, GSS_data$happy),]
GSS_data <- GSS_data[!grepl(0, GSS_data$mntlhlth),]


GSS_cleaned_data <- GSS_data











#### AVERAGES OF EACH VARIABLE AGAINST HAPPINESS LEVEL ####

## Family income when 16 yrs old VS. Happiness ##
mean_incom16<- GSS_cleaned_data %>%
  select(incom16,happy) %>%
  group_by(incom16)%>%
  summarise(Mean_total = mean(happy, na.rm=TRUE) )%>%
  pivot_wider(names_from = "incom16", values_from = c("Mean_total"))
# mutate from wide to long #
mean_incom16 <- melt(mean_incom16)  #the function melt reshapes it from wide to long
# delete not applied data
mean_incom16 <- mean_incom16[-1,]
mean_incom16 <- mean_incom16[-1,]
mean_incom16 <- mean_incom16[-1,]





## Total family income VS. Happiness ##
mean_income<- GSS_cleaned_data %>%
  select(income,happy) %>%
  group_by(income)%>%
  summarise(Mean_total = mean(happy , na.rm=TRUE) )%>%
  pivot_wider(names_from = "income", values_from = c("Mean_total"))
# mutate from wide to long #
mean_income <- melt(mean_income)  #the function melt reshapes it from wide to long
# delete not applied data
mean_income <- mean_income[-12,]
mean_income <- mean_income[-12,]





## Personal income VS.  Happiness ##
mean_rincome<- GSS_cleaned_data %>%
  select(rincome,happy) %>%
  group_by(rincome)%>%
  summarise(Mean_total = mean(happy , na.rm=TRUE) )%>%
  pivot_wider(names_from = "rincome", values_from = c("Mean_total"))
# mutate from wide to long #
mean_rincome <- melt(mean_rincome)  #the function melt reshapes it from wide to long
# delete not applied data
mean_rincome <- mean_rincome[-12,]
mean_rincome <- mean_rincome[-12,]
mean_rincome <- mean_rincome[-12,]
mean_rincome <- mean_rincome[-12,]












#### AVERAGES OF EACH VARIABLE AGAINST DAYS OF POOR MENTAL HEALTH WITHIN A MONTH ####

## Family income when 16 yrs old VS. Mental Health ##
mean_incom16_2<- GSS_cleaned_data %>%
  select(incom16,mntlhlth) %>%
  group_by(incom16)%>%
  summarise(Mean_total = mean(mntlhlth, na.rm=TRUE) )%>%
  pivot_wider(names_from = "incom16", values_from = c("Mean_total"))
# mutate from wide to long #
mean_incom16_2 <- melt(mean_incom16_2)  #the function melt reshapes it from wide to long
# delete not applied data
mean_incom16_2 <- mean_incom16_2[-1,]
mean_incom16_2 <- mean_incom16_2[-1,]
mean_incom16_2 <- mean_incom16_2[-1,]





## Total family income VS. Happiness ##
mean_income_2<- GSS_cleaned_data %>%
  select(income,mntlhlth) %>%
  group_by(income)%>%
  summarise(Mean_total = mean(mntlhlth , na.rm=TRUE) )%>%
  pivot_wider(names_from = "income", values_from = c("Mean_total"))
# mutate from wide to long #
mean_income_2 <- melt(mean_income_2)  #the function melt reshapes it from wide to long
# delete not applied data
mean_income_2 <- mean_income_2[-12,]
mean_income_2 <- mean_income_2[-12,]



## Personal income VS.  Happiness ##
mean_rincome_2<- GSS_cleaned_data %>%
  select(rincome,mntlhlth) %>%
  group_by(rincome)%>%
  summarise(Mean_total = mean(mntlhlth , na.rm=TRUE) )%>%
  pivot_wider(names_from = "rincome", values_from = c("Mean_total"))
# mutate from wide to long #
mean_rincome_2<- melt(mean_rincome_2)  #the function melt reshapes it from wide to long
# delete not applied data
mean_rincome_2 <- mean_rincome_2[-12,]
mean_rincome_2 <- mean_rincome_2[-12,]
mean_rincome_2 <- mean_rincome_2[-12,]
mean_rincome_2 <- mean_rincome_2[-12,]









#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(GSS_cleaned_data, "Outputs/data/GSS_cleaned_data.csv")

write_csv(mean_income, "Outputs/data/mean_income.csv")
write_csv(mean_incom16, "Outputs/data/mean_incom16.csv")
write_csv(mean_rincome, "Outputs/data/mean_rincome.csv")


write_csv(mean_income_2, "Outputs/data/mean_income_2.csv")
write_csv(mean_incom16_2, "Outputs/data/mean_incom16_2.csv")
write_csv(mean_rincome_2, "Outputs/data/mean_rincome_2.csv")

