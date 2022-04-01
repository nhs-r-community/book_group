library(tidyverse)

df <- nycflights13::flights
airlines <- nycflights13::airlines

# 5.4.1-1 -----------------------------------------------------------------


# Gets anything with dep or arr
df %>% 
  select(matches("dep|arr"))

# match starts with (uses regular expressions and allows for | as or)

df %>% 
  select(matches("^(dep|arr)"))

# Doesn't do regular expressions
df %>% 
  select(starts_with("dep|arr"))

df %>% 
  select(starts_with("dep"),
         starts_with("arr"))

df %>% 
  select(ends_with("time"),
         ends_with("delay"))

listing <- c("dep_time", "dep_delay", "arr_time", "arr_delay")

df %>% 
  select(all_of(listing))

df %>% 
  select(c("dep_time", "dep_delay", "arr_time", "arr_delay"))

df %>% 
  select(listing)

# !! (known as bang bang) was needed when listing wouldn't work to evaluate

df %>% 
  select(!!listing)

# Select new name, old name

df %>% 
  select(depature_time = dep_time)

df %>% 
  rename(departure_time = dep_time)

# 5.4.1-2

df %>% 
  select(year, 
         month,
         month)

df %>% 
  select(month,
         year, 
         month)


# 5.4.1-3 -----------------------------------------------------------------

vars <- c("year", "month", "day", "dep_delay", "arr_delay")

# Different to all_of as won't fail if missing

df %>% 
  select(any_of(vars))

# Add "test" which isn't a column to show the difference

vars <- c("year", "month", "day", "dep_delay", "arr_delay", "test")

df %>% 
  select(any_of(vars))

df %>% 
  select(all_of(vars))


# 5.4.1-4 -----------------------------------------------------------------

# ignores case

select(nycflights13::flights, contains("TIME"))
