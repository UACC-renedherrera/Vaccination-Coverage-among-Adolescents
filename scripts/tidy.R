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
library(RSocrata)
library(janitor)
library(tidyverse)

# read data ####
vac_data <- read.socrata(url = "https://data.cdc.gov/resource/ee48-w5t6.json") %>%
  clean_names() %>%
  as_tibble()

# inspect ####
glimpse(vac_data)

# geography type
vac_data %>%
  count(geography_type)

# geography
vac_data %>%
  count(geography)

# year 
vac_data %>%
  count(year_season)

# dimension type
vac_data %>%
  count(dimension_type)

# dimension
vac_data %>%
  count(dimension)

# tidy ####
# change character variables to numeric 
vac_data <- vac_data %>%
  mutate(
    coverage_estimate = as.numeric(coverage_estimate),
    population_sample_size = as.numeric(population_sample_size)
  )

# need to parse the 95 CI to lower and upper 


# save to disk ####
write_rds(vac_data, "data/tidy/vaccination_data.rds")
