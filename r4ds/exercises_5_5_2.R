library(tidyverse)

df <- nycflights13::flights
airlines <- nycflights13::airlines


# 5.5.2-1 -----------------------------------------------------------------

df %>% 
  select(dep_time,
         sched_dep_time) %>% 
  mutate(hour_dep_time = dep_time %/% 100,
         min_dep_time = dep_time %% 100,
         minutes_past_midnight_dep_time = (hour_dep_time * 60) + min_dep_time)


# 5.5.2-2 -----------------------------------------------------------------

# air_time is in minutes and arr/dep_time is a time

df %>% 
  select(air_time,
         arr_time,
         dep_time) %>% 
  mutate(time = arr_time - dep_time) %>% 
  view()

# fix it

df %>% 
  select(air_time,
         arr_time,
         dep_time) %>% 
  mutate(dep_time = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440, # 12 o'clock 24 hour
         arr_time = (arr_time %/% 100 * 60 + arr_time %% 100) %% 1440,
         air_time_diff = air_time - arr_time + dep_time)


# 5.5.2-3 -----------------------------------------------------------------

df %>% 
  select(dep_time,
         sched_dep_time,
         dep_delay) %>% 
  View()
