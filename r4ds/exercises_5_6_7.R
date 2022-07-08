library(tidyverse)

flights <- nycflights13::flights
airlines <- nycflights13::airlines


# in date order
df %>% 
  count(month)

# sorts by
df %>% 
  count(month, sort = TRUE)

# using carrier to be clearer
df %>% 
  count(carrier)

df %>% 
  count(carrier, sort = TRUE)

# tally

df %>% 
  group_by(carrier) %>% 
  tally()

library(NHSRdatasets)

ae <- NHSRdatasets::ae_attendances %>% 
  filter(type == 1)

ae %>% 
  count(org_code)

ae %>% 
  count(organisation_code = org_code, 
        name = "attendances", 
        wt = attendances)

ae %>% 
  group_by(organisation_code = org_code) %>% 
  summarise(attendances = sum(attendances))

# R0A has fewer observations
ae %>% 
  count(org_code)

# Filtering on not full years' data
ae %>% 
  group_by(org_code) %>% 
  filter(n() != 36)
