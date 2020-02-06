# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month <- flights %>%
  group_by(month) %>%
  summarize(departure_delay = mean(dep_time, na.rm = TRUE))

# Which month had the greatest average departure delay?
greatest_departure_delay <- dep_delay_by_month %>%
  arrange(-departure_delay) %>%
  select(month) %>%
  head(1) %>%
  pull()

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)


# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
greatest_average_arrival_delay_by_destination <- flights %>%
  group_by(dest) %>%
  summarize(arrival_delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(-arrival_delay) %>%
  head()

# You can look up these airports in the `airports` data frame!
View(airports)

# Which city was flown to with the highest average speed?
city_flown_with_highest_speed <- flights %>%
  select(dest, distance, air_time) %>%
  mutate(average_speed = (distance / air_time) * 60) %>%
  arrange(-average_speed) %>%
  head(1) %>%
  pull(dest)