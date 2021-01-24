#IIT ROORKEE INTERVIEW APPROACH
data <- read.csv("ca_metros - ca_metros.csv",stringsAsFactors = FALSE)


#structure of the data
str(data)

#total leangth of data 
length(data$region_id)

#variables
length(data)

#some data portions
head(data)

library(DT)
datatable(head(data))  


#preprocess
data$period_begin <- as.Date(data$period_begin) 
data$period_end <- as.Date(data$period_end)


#view table
datatable(head(data))

#Task1
task1_data <- with(data,data[(period_begin>="2017-01-02"),])

#grouping data according to each metro area
library(dplyr)

#factoring data according to region type
task1_data$region_id <- as.factor(task1_data$region_id)
task1_data$region_name <- as.factor(task1_data$region_name)

#plot Task-1
library(ggplot2)
ggplot(task1_data, aes(x=period_begin, y=median_sale_price))+
  geom_line(aes(color=region_name))+
  scale_y_log10()+
  labs(x = "Periods stated",
       y = "median sales value in log scale" ) +
  ggtitle("Time Frame vs. Median Sales")


#plot Task-2
datatable(head(data,100))

#filter data
sanfrancisco_data <- data %>% filter(region_id==41884) 
sanfrancisco_data$year <- format(sanfrancisco_data$period_begin,"%Y")
datatable(head(sanfrancisco_data,100))

sanfrancisco_data$date <- format(sanfrancisco_data$period_begin,"%m%d")

grouped_data <- sanfrancisco_data %>% group_by(year) %>% arrange(date)

#plot 
ggplot(grouped_data,aes(x=date, y=median_sale_price,group=year,color=year))+
  geom_line(size=1.3)+
  scale_color_brewer(palette = "Dark2")+
  theme_minimal() +
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE))+
  labs(x = "Periods stated",
       y = "median sales value in log scale" ) +
  ggtitle("Time Frame vs. Median Sales with yearly variation in sanfrancisco Area")


##------------Done--------------------------


       
       