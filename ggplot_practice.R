# ------------------------------------------------------------------------------
# Setup

cancer_df <- read_csv("data/breast-cancer.csv")
oil_df <- read_xls("oil-price.xls", sheet="Data 1", skip=2)
rolling_stones_df <- read_rds("rolling_stones_discography.Rds")
expenditure_df <- read_csv("expenditure.csv")

library(ggplot2)
library(lubridate)
library(dplyr)
library(janitor)


# ------------------------------------------------------------------------------
# Chart 1 ----------------------------------------------------------------------

# Use oil_df to produce a line chart of price vs time
# Show the difference in autocomplete with pipes

# Code goes here

# ------------------------------------------------------------------------------
# Chart 2 ----------------------------------------------------------------------

# Summarise the oil_df so that you get the mean price per year
# Then produce a bar (geom_col) chart with one bar per year and mean price

oil_data <- oil_df %>%
  select(date=Date, 
         daily_price=`Europe Brent Spot Price FOB (Dollars per Barrel)`) %>%
  mutate(year = year(date)) %>%
  group_by(year) %>% 
  summarise(mean_price = mean(daily_price))

ggplot(oil_data, aes(x=year, y=mean_price)) +
  geom_col() + 
  labs(x="Year", y="Mean Price",
       title="Mean price per day")

# ------------------------------------------------------------------------------
# Chart 3 ----------------------------------------------------------------------

# Plot a histogram with geom_histogram for the age of the patients in cancer_df. 
# Play with the binwidth argument in geom_histogram

ggplot(cancer_df, aes(x=age)) +
  geom_histogram(binwidth = 10) + # If we want groups/range of 10 years.
  labs(title="Distribution of patients age")
  

# ------------------------------------------------------------------------------
# Chart 4 ----------------------------------------------------------------------

# Plot a density chart for the age of the patiens in cancer_df. Try to get three 
# overlapping density charts on one chart, one per value in column breast-quad.

# Code goes here


cancer_df %>%
  filter(!is.na(`breast-quad`)) %>%  # Remove that NA value that's causing trouble
  ggplot(aes(x=age)) +
  geom_density(aes(fill=`breast-quad`),alpha=0.4) +
  labs(title="Distribution of patients age depending on the tumor location")

# ------------------------------------------------------------------------------
# Chart 5 ----------------------------------------------------------------------

# Plot a scatter plot with geom_point of `loudness` vs `track_popularity` 
# in rolling_stones_df. 

# Code goes here
ggplot(rolling_stones_df, aes(x=loudness, y=track_popularity)) +
  geom_point() 

# ------------------------------------------------------------------------------
# Chart 6 ----------------------------------------------------------------------
# Try changing the theme on all the charts above, by using + theme_<theme_name>.
# The list of available themes is here: 
# http://ggplot2.tidyverse.org/reference/ggtheme.html








