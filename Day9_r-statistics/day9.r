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

#Obtaining basic statistical measures of delay times of flights headed to RDU, grouped by airport of origin in NYC.
rdu_flights %>%
    group_by(origin)  %>% 
    summarise(mean_dd = mean(dep_delay), sd_dd = sd(dep_delay))

#Finding out which month had the highest average flight departure delay time.
nycflights  %>% 
    group_by(month)  %>% 
    summarise(mean_dd = mean(dep_delay)) %>% 
    arrange(desc(mean_dd))

ggplot(nycflights, aes(x = factor(month), y = dep_delay)) +
    geom_boxplot()

#Using the ifelse function to classify flight departures as "on time" or "delayed".
nycflights <- nycflights  %>% 
    mutate(dep_type = ifelse(dep_delay < 5, "on time", "delayed"))

#Finding the proportion of on-time departures at each NYC airport.
nycflights  %>% 
    group_by(origin)  %>% 
    summarise(ot_dep_rate = sum(dep_type == "on time") / n())  %>% 
    arrange(desc(ot_dep_rate))

ggplot(data = nycflights, aes(x = origin, fill = dep_type)) +
    geom_bar()

#Adding a variable of average flight speed to the dataframe.
nycflights <- nycflights  %>% 
    mutate(avg_speed = (distance/air_time)/60)

#Note: In accordance with Coursera's Honor Code, some lines of code -- namely, quiz answers -- have been removed.