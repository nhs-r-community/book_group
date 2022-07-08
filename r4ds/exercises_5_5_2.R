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


# 5.5.2-4 -----------------------------------------------------------------

# cheat's way :) 
df %>% 
  select(dep_time,
         sched_dep_time,
         dep_delay) %>% 
  arrange(desc(dep_delay)) %>% 
  head(10)

# Using the - in the column acts like a max_rank that doesn't exist  
df %>% 
  select(dep_time,
         sched_dep_time,
         dep_delay) %>% 
  mutate(most_delayed = min_rank(-dep_delay)) %>% 
  arrange(most_delayed)

df %>% 
  select(dep_time,
         sched_dep_time,
         dep_delay) %>% 
  mutate(most_delayed = min_rank(-dep_delay)) %>% 
  filter(most_delayed <10)

#with a tie
df %>% 
  select(dep_time,
         sched_dep_time,
         dep_delay) %>% 
  mutate(most_delayed = rank(-dep_delay, ties.method = "last")) %>% 
  filter(most_delayed <10)


# 5.5.2-5 -----------------------------------------------------------------

1:3 + 1:10

# Let's never do this!
df %>%  
  mutate(dep_time = dep_time + 1:2) %>% 
  select(dep_time)


# 5.5.2-6 -----------------------------------------------------------------

?trig

# Don't do this!!!!
# c <- 21


# 5.6 ---------------------------------------------------------------------

not_cancelled <- df %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

delays %>% 
  filter(n > 200) %>%
  ggplot(mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)

# this instead

delays %>% 
  select(-c(2:3))

delays %>% 
  select(-(2:3))


delays %>% 
  select(-c(delay: n))
