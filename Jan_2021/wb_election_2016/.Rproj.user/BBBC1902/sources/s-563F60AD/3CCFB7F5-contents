#congress
congress <- Detailed_Results %>% filter(`Party Name`=="INC")
datatable(congress)

p <- ggplot(congress, aes(`Candidate Age`,fill=`Candidate Sex`)) + geom_density(alpha = 0.5)+ggtitle("Density chart of congress candidates age")
fig <- ggplotly(p)
fig

#stacked density
library(plotly)
set.seed(123)
p <- ggplot(congress, aes(`Candidate Age`, fill = `Candidate Sex`)) + 
  geom_density(alpha = 0.5, position = "stack") + 
  ggtitle("stacked density chart of congress candidates age")
fig <- ggplotly(p)
fig

#scatterplot
p <- ggplot(congress, aes(`Candidate Age`,rnorm(92))) + 
  geom_point(alpha = 0.5) + 
  geom_density_2d() + 
  theme(panel.background = element_rect(fill = '#ffffff')) +
  labs(x="Age of congress Candidate",
       y = "Contour value")+
  ggtitle("2D density plot with scatterplot overlay of congress Candidates with Age")
fig <- ggplotly(p)
fig

#sexual distribution 
fig <- congress %>% plot_ly(x=~`Candidate Sex`,color=~`Candidate Category`)
fig <- fig %>% layout(title = 'Male and Female seat distribution of congress Based on Cast'
)
fig

#gender biasness
fig <- congress %>% plot_ly(x=~`Candidate Sex`,color=~`Candidate Sex`)
fig <- fig %>% layout(title = 'Male and Female seat distribution of congress'
)
fig

#votes
p <- ggplot(congress, aes(`VALID VOTES POLLED in General`,fill=`Candidate Sex`)) +
  geom_density(alpha = 0.5)+
  ggtitle("Density chart of congress candidates Valid vote in Election gender wise")
fig <- ggplotly(p)
fig

p <- ggplot(congress, aes(`VALID VOTES POLLED in General`)) +
  geom_density(alpha = 0.5,fill="green")+
  ggtitle("Density chart of congress candidates Valid vote in Election")
fig <- ggplotly(p)
fig

p <- ggplot(congress, aes(`VALID VOTES POLLED in General`,fill=`Candidate Category`)) +
  geom_density(alpha = 0.5)+
  ggtitle("Density chart of congress candidates Valid vote in Election Cast wise")
fig <- ggplotly(p)
fig

#scatter chart age with votes in total
fig <- plot_ly(data = congress, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(title = 'Male and Female total vote share in Number for congress'
)
fig

fig <- plot_ly(data = congress, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Category`,colors = "Set1")
fig <- fig %>% layout(title = 'CastWise total vote share in Number for congress'
)
fig

#size
fig <- plot_ly(data = congress, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Category`,colors = "Set1",size = ~`Total Valid Votes`)
fig <- fig %>% layout(title = 'CastWise total vote share in Number for congress'
)
fig

#
fig <- plot_ly(data = congress, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Sex`,colors = "Set1",size = ~`Total Valid Votes`)
fig <- fig %>% layout(title = 'Male and Female total vote share in Number for congress'
)
fig