library(readxl)
data <- read_excel("data/List Of Political Parties Participated.xlsx", 
                                                     col_types = c("text", "text", "text"), 
                                                     skip = 1)

#visualization
library(DT)
datatable(data)


#statement-I 

# Analysis of parties based on their reach
library(ggplot2)

ggplot(data,aes(x= as.factor(`Party Type`),fill=as.factor(`Party Type`))) +
  geom_bar( )+
  labs(x = "Type of parties in code",
       y = "count of parties" ) +
  ggtitle("categorical participation analysis")

  
