# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
avg_arrival_delays <- flights %>% 
  group_by(dest) %>% 
  summarize(arrival_delay_average = mean(arr_delay, na.rm = TRUE))

View(avg_arrival_delays)

avg_arrival_delays <- left_join(avg_arrival_delays, flights, by = "dest")


View(avg_arrival_delays)

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?

