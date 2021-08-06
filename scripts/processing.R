# HPV vaccination rates? 
# René Dario Herrera 
# The University of Arizona Cancer Center 
# renedherrera at email dot arizona dot edu 
# 6 Aug 2021

# source info 
# Vaccination Coverage among Adolescents (13-17 Years)
# Data on adolescent vaccination coverage and selected sociodemographic characteristics by State, HHS Region, and the United States from the National Immunization Survey-Teen (NIS-Teen).
# Additional information available at https://www.cdc.gov/vaccines/imz-managers/coverage/teenvaxview/index.html
# https://data.cdc.gov/Teen-Vaccinations/Vaccination-Coverage-among-Adolescents-13-17-Years/ee48-w5t6

# setup ####
library(here)
library(tidyverse)

# read data 
vac_data <- read_rds("data/tidy/vaccination_data.rds")

# inspect 
class(vac_data)
glimpse(vac_data)

# what is the vaccination rate for AZ in 2019
vac_data %>%
  