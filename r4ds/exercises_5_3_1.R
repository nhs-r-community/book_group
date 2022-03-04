library(tidyverse)

df <- nycflights13::flights
airlines <- nycflights13::airlines

df <- tibble(x = c(5, 2, NA))
arrange(df, x)
#> # A tibble: 3 x 1
#>       x
#>   <dbl>
#> 1     2
#> 2     5
#> 3    NA
arrange(df, desc(x))
#> # A tibble: 3 x 1
#>       x
#>   <dbl>
#> 1     5
#> 2     2
#> 3    NA

# 5.3.1-1
arrange(df, desc(is.na(x)))

# 5.3.1-2

df %>% 
  arrange(desc(dep_delay)
          #dep_time
          )

# 5.3.1-3

df %>% 
  arrange(air_time)

# 5.3.1-4

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

# match starts with

df %>% 
  select(matches("^(dep|arr)"))

# Doesn't do regular expressions?
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

df %>% 
  select(!!listing)
