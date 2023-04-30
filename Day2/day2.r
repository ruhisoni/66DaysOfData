#Loading the required packages for this lab project.
library(dplyr)
library(ggplot2)
library(statsr)

#Loading the dataframe called "arbuthnot" into the RStudio workplace. 
data(arbuthnot)

#Examples of R commands to learn more about the data
dim(arbuthnot)
names(arbuthnot)
arbuthnot$boys
range(arbuthnot$year)

#Adding more variables to the dataframe using the pipeline operator.
arbuthnot <- arbuthnot %>%
  mutate(total = boys + girls)
arbuthnot <- arbuthnot %>%
  mutate(more_boys = boys > girls)

#Examples of data visualization using ggplot.
ggplot(data = arbuthnot, aes(x = year, y = girls)) +
  geom_point()
ggplot(data = arbuthnot, aes(x = year, y = total)) +
  geom_line()
ggplot(data = arbuthnot, aes(x = year, y = total)) +
  geom_line() +
  geom_point()

#Note: In accordance with Coursera's Honor Code, some lines of code -- namely, quiz answers -- have been removed.