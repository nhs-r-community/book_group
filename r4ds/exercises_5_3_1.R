library(tidyverse)

df <- nycflights13::flights
airlines <- nycflights13::airlines

df2 <- tibble(stuff_counted = c(5, 2, NA))
arrange(df2, stuff_counted)
#> # A tibble: 3 x 1
#>       x
#>   <dbl>
#> 1     2
#> 2     5
#> 3    NA
arrange(df2, desc(stuff_counted))
#> # A tibble: 3 x 1
#>       x
#>   <dbl>
#> 1     5
#> 2     2
#> 3    NA

# 5.3.1-1
arrange(df2, desc(is.na(stuff_counted)))

# 5.3.1-2

df %>% 
  arrange(desc(dep_delay)
          #dep_time
          )

# 5.3.1-3

df %>% 
  arrange(air_time)

# 5.3.1-4
# NAs dropped from departure time before the arranging of distance

df %>% 
  drop_na(dep_time) %>%
  arrange(distance) 

# filter out all NA in all columns

df %>% 
  drop_na() %>% 
  arrange(distance) 

# 5.4.1-1

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

# 5.4.1-3

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
