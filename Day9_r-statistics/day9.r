#Loading the required libraries for this lab project.
library(dplyr)
library(ggplot2)
library(statsr)

#Loading the dataframe called "nycflights" into the RStudio workplace, along with some information on the dataframe.
data(nycflights)
names(nycflights)
str(nycflights)

#Plotting a histogram of flight departure delay times.
ggplot(data = nycflights, aes(x = dep_delay)) +
    geom_histogram(binwidth = 15)

#Filtering for depature delay times of flights headed to Raleigh-Durham (RDU).
rdu_flights <- nycflights %>% 
    filter(dest == "RDU")
ggplot(data = rdu_flights, aes(x = dep_delay)) +
    geom_histogram(binwidth = 15)

#Obtaining basic statistical measures of departure delay times of flights headed to RDU.
rdu_flights %>%
    summarise(mean_dd = mean(dep_delay), median_dd = median(dep_delay), variance_dd = var(dep_delay), sd_dd = sd(dep_delay), IQR_dd = IQR(dep_delay), range_dd = range(dep_delay), min_dd = min(dep_delay), max_dd = max(dep_delay), n = n())

#Filtering for flights headed to San Francisco (SFO) in February.
sfo_feb_flights <- nycflights %>%
    filter(dest == "SFO", month == 2)