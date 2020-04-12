#importing library
library(ggplot2) #data visualization
library(ggthemes)#add-on to our main ggplot2
library(lubridate)# time categories
library(dplyr)#data manipulation
library(tidyr)#tidy data
library(DT)#datatable
library(scales)#graphical scales


#read data
apr_data <- read.csv("./Uber-dataset/uber-raw-data-apr14.csv/uber-raw-data-apr14.csv")
may_data <- read.csv("./Uber-dataset/uber-raw-data-may14.csv/uber-raw-data-may14.csv")
jun_data <- read.csv("./Uber-dataset/uber-raw-data-jun14.csv/uber-raw-data-jun14.csv")
jul_data <- read.csv("./Uber-dataset/uber-raw-data-jul14.csv/uber-raw-data-jul14.csv")
aug_data <- read.csv("./Uber-dataset/uber-raw-data-aug14.csv/uber-raw-data-aug14.csv")
sep_data <- read.csv("./Uber-dataset/uber-raw-data-sep14.csv/uber-raw-data-sep14.csv")


#combining all the data
data_2014 <- rbind(apr_data,may_data,jun_data,jul_data,aug_data,sep_data)

#visualization of data
head(data_2014)
length(data_2014$Date.Time) #number of records

#as date-time
data_2014$Date.Time <- as.POSIXct(data_2014$Date.Time, format = "%m/%d/%Y %H:%M:%S")

#time 
data_2014$Time <- format(as.POSIXct(data_2014$Date.Time, format = "%m/%d/%Y %H:%M:%S"), format="%H:%M:%S")

data_2014$Date.Time <- ymd_hms(data_2014$Date.Time)
data_2014$day <- factor(day(data_2014$Date.Time))
data_2014$month <- factor(month(data_2014$Date.Time, label = TRUE))
data_2014$year <- factor(year(data_2014$Date.Time))
data_2014$dayofweek <- factor(wday(data_2014$Date.Time, label = TRUE))
data_2014$hour <- factor(hour(hms(data_2014$Time)))
data_2014$minute <- factor(minute(hms(data_2014$Time)))
data_2014$second <- factor(second(hms(data_2014$Time)))

#data
head(data_2014)

#plotting the trip by the hours in a day
hour_data <- data_2014 %>%
  group_by(hour) %>%
  dplyr::summarize(Total = n()) 
#Tabuler view
datatable(hour_data)
#normal view
head(hour_data)
#visualization
ggplot(hour_data, aes(hour, Total)) + 
  geom_bar( stat = "identity", fill = "steelblue", color = "red") +
  ggtitle("Trips Every Hour") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)
#As you see in result the peak starts from 16 (4 pm) and continoue upto 21(9 pm)

month_hour <- data_2014 %>%
  group_by(month, hour) %>%
  dplyr::summarize(Total = n())
ggplot(month_hour, aes(hour, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Hour and Month") +
  scale_y_continuous(labels = comma)

#let's see september months data
sept_hour <- data_2014 %>% 
  group_by(month, hour) %>% 
  filter(month=="Sep") %>%
  summarise(Total =n())

ggplot(sept_hour, aes(hour, Total, fill = hour)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Hour in Sept") +
  scale_y_continuous(labels = comma)

#let's see April data
Apr_hour <- data_2014 %>% 
  group_by(month, hour) %>% 
  filter(month=="Apr") %>%
  summarise(Total =n())

ggplot(Apr_hour, aes(hour, Total, fill = hour)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Hour in Apr") +
  scale_y_continuous(labels = comma)

#Plotting data by trips during every day of the month
day_group <- data_2014 %>%
  group_by(day) %>%
  dplyr::summarize(Total = n()) 
datatable(day_group)


ggplot(day_group, aes(day, Total)) + 
  geom_bar( stat = "identity", fill = "steelblue") +
  ggtitle("Trips Every Day") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)

#last day of month has less value it may be because not all the month has 31 days

day_month_group <- data_2014 %>%
  group_by(month, day) %>%
  dplyr::summarize(Total = n())
ggplot(day_month_group, aes(day, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Day and Month") +
  scale_y_continuous(labels = comma) 

month_group <- data_2014 %>%
  group_by(month) %>%
  dplyr::summarize(Total = n()) 
datatable(month_group)

ggplot(month_group , aes(month, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Month") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)
  


month_weekday <- data_2014 %>%
  group_by(month, dayofweek) %>%
  dplyr::summarize(Total = n())
ggplot(month_weekday, aes(month, Total, fill = dayofweek)) + 
  geom_bar( stat = "identity", position = "dodge") +
  ggtitle("Trips by Day and Month") +
  scale_y_continuous(labels = comma)# +
  #scale_fill_manual

weekday <- data_2014 %>%
  group_by(dayofweek) %>%
  dplyr::summarize(Total = n())
ggplot(weekday, aes(dayofweek,Total, fill = dayofweek)) + 
  geom_bar( stat = "identity", position = "dodge") +
  ggtitle("Trips by Day and Month") +
  scale_y_continuous(labels = comma)# +
#scale_fill_manual



ggplot(data_2014, aes(Base)) + 
  geom_bar(fill = "darkred") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases")


ggplot(data_2014, aes(Base, fill = month)) + 
  geom_bar(position = "dodge") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases and Month")#+
  #scale_fill_manual(values = colors)


ggplot(data_2014, aes(Base, fill = dayofweek)) + 
  geom_bar(position = "dodge") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases and DayofWeek") #+
  #scale_fill_manual(values = colors)


day_and_hour <- data_2014 %>%
  group_by(day, hour) %>%
  dplyr::summarize(Total = n())
datatable(day_and_hour)

ggplot(day_and_hour, aes(day, hour, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Hour and Day")


ggplot(day_month_group, aes(day, month, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Month and Day")


ggplot(month_weekday, aes(dayofweek, month, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Month and Day of Week")


month_base <-  data_2014 %>%
  group_by(Base, month) %>%
  dplyr::summarize(Total = n()) 
day0fweek_bases <-  data_2014 %>%
  group_by(Base, dayofweek) %>%
  dplyr::summarize(Total = n()) 
ggplot(month_base, aes(Base, month, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Month and Bases")


ggplot(day0fweek_bases, aes(Base, dayofweek, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Bases and Day of Week")


min_lat <- 40.5774
max_lat <- 40.9176
min_long <- -74.15
max_long <- -73.7004
ggplot(data_2014, aes(x=Lon, y=Lat)) +
  geom_point(size=1, color = "blue") +
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2014 (APR-SEP)")
ggplot(data_2014, aes(x=Lon, y=Lat, color = Base)) +
  geom_point(size=1) +
  scale_x_continuous(limits=c(min_long, max_long)) +
  scale_y_continuous(limits=c(min_lat, max_lat)) +
  theme_map() +
  ggtitle("NYC MAP BASED ON UBER RIDES DURING 2014 (APR-SEP) by BASE")

