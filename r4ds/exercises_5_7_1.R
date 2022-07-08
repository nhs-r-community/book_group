# 5.7 ---------------------------------------------------------------------

popular_dests <- flights %>% 
  group_by(dest) %>% 
  filter(n() > 365)

popular_dests

popular_dests %>% 
  filter(arr_delay > 0) %>% 
  mutate(prop_delay = arr_delay / sum(arr_delay)) %>% 
  select(year:day, dest, arr_delay, prop_delay)


tibble(x = runif(9),
       group = rep(c("a", "b", "c"), each = 3)) %>%
  group_by(group) %>%
  arrange(x)

# Though not asked in the question, note that arrange() ignores groups when sorting values.
# https://jrnold.github.io/r4ds-exercise-solutions/transform.html#exercise-5.7.1
df <- flights %>% 
  group_by(carrier,
           month) %>%
  summarise(n = n()) %>% 
  arrange(n)

df

df <- flights %>% 
  group_by(carrier,
           month) %>%
  summarise(n = n()) %>% 
  arrange(carrier,
          n)
