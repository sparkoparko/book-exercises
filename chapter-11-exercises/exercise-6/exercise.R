# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
average_arrival_delays_for_destination <- flights %>%
  group_by(dest) %>%
  summarize(average_arrival_delay = mean(arr_delay, na.rm = TRUE)) %>%
  left_join(airports, average_arrival_for_destination, by = "dest")
  
# Which airport had the largest average arrival delay?
average_arrival_delays_for_destination %>% arrange(-average_arrival_delay)
# CAE

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
average_arrival_delay_for_airline <- flights %>%
  group_by(carrier) %>%
  summarize(average_arrival_delay = mean(arr_delay, na.rm = TRUE)) %>%
  left_join(airlines, average_arrival_delay_for_airline, by = "carrier") %>%
  arrange(average_arrival_delay)
# Alaska Airlines