library(dplyr)
library(stringr)

df <- nycflights13::flights
airlines <- nycflights13::airlines

exercise1 <- df %>%
  filter(arr_delay >= 120)

exercise2 <- df %>%
  filter(dest %in% c("IAH", "HOU"))

exercise3 <- df %>%
  filter(carrier %in% c("UA", "AA", "DL"))

ex3 <- df %>%
  semi_join(airlines %>%
              filter(str_detect(name, "United|Delta|American")))

unique(ex3$carrier)

ex3 %>%
  distinct(carrier)


exercise4 <- df %>%
  filter(month %in% c(7, 8, 9))

ex4 <- df %>%
  filter(month %in% 7:9)

exercise5 <- df %>%
  filter(arr_delay >= 120 & dep_delay < 1)

exercise6 <- df %>%
  filter(dep_delay >= 60 & dep_delay - arr_delay > 31)

exercise7 <- df %>%
  filter(dep_time <= 600 | dep_time == 2400)


range(df$sched_dep_time)
range(df$dep_time, na.rm = TRUE)

exercise7_between <- df %>%
  filter(!between(dep_time, 601, 2359))

exercise3_missing <- df %>%
  filter(is.na(dep_time)) %>%
  summarise(n())

ex3_missing <- df %>%
  filter(is.na(dep_time)) %>%
  nrow()

length(is.na(df$dep_time))

df %>%
  count(is.na(dep_time))

df %>%
  filter(is.na(dep_time)) %>%
  count()

df %>%
  summarise(sum(is.na(dep_time)))

df %>%
  summarise(mean(is.na(dep_time))) # calculates the percentage of missing
