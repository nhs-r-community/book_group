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


# 5.3.1-1 -----------------------------------------------------------------


arrange(df2, desc(is.na(stuff_counted)))


# 5.3.1-2 -----------------------------------------------------------------

df %>% 
  arrange(desc(dep_delay)
          #dep_time
          )


# 5.3.1-3 -----------------------------------------------------------------

df %>% 
  arrange(air_time)


# 5.3.1-4 -----------------------------------------------------------------

# NAs dropped from departure time before the arranging of distance

df %>% 
  drop_na(dep_time) %>%
  arrange(distance) 

# filter out all NA in all columns

df %>% 
  drop_na() %>% 
  arrange(distance) 

