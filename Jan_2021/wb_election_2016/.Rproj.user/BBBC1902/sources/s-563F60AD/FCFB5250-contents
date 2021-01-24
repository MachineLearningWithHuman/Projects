#cpiml_l
cpiml_l <- Detailed_Results %>% filter(`Party Name`=="CPI(ML)(L)")
datatable(cpiml_l)

p <- ggplot(cpiml_l, aes(`Candidate Age`,fill=`Candidate Sex`)) + geom_density(alpha = 0.5)+ggtitle("Density chart of cpiml_l candidates age")
fig <- ggplotly(p)
fig

#stacked density
library(plotly)
set.seed(123)
p <- ggplot(cpiml_l, aes(`Candidate Age`, fill = `Candidate Sex`)) + 
  geom_density(alpha = 0.5, position = "stack") + 
  ggtitle("stacked density chart of cpiml_l candidates age")
fig <- ggplotly(p)
fig

#scatterplot
p <- ggplot(cpiml_l, aes(`Candidate Age`,rnorm(35))) + 
  geom_point(alpha = 0.5) + 
  geom_density_2d() + 
  theme(panel.background = element_rect(fill = '#ffffff')) +
  labs(x="Age of cpiml_l Candidate",
       y = "Contour value")+
  ggtitle("2D density plot with scatterplot overlay of cpiml_l Candidates with Age")
fig <- ggplotly(p)
fig

#sexual distribution 
fig <- cpiml_l %>% plot_ly(x=~`Candidate Sex`,color=~`Candidate Category`)
fig <- fig %>% layout(title = 'Male and Female seat distribution of cpiml_l Based on Cast'
)
fig

#gender biasness
fig <- cpiml_l %>% plot_ly(x=~`Candidate Sex`,color=~`Candidate Sex`)
fig <- fig %>% layout(title = 'Male and Female seat distribution of cpiml_l'
)
fig

#votes
p <- ggplot(cpiml_l, aes(`VALID VOTES POLLED in General`,fill=`Candidate Sex`)) +
  geom_density(alpha = 0.5)+
  ggtitle("Density chart of cpiml_l candidates Valid vote in Election gender wise")
fig <- ggplotly(p)
fig

p <- ggplot(cpiml_l, aes(`VALID VOTES POLLED in General`)) +
  geom_density(alpha = 0.5,fill="green")+
  ggtitle("Density chart of cpiml_l candidates Valid vote in Election")
fig <- ggplotly(p)
fig

p <- ggplot(cpiml_l, aes(`VALID VOTES POLLED in General`,fill=`Candidate Category`)) +
  geom_density(alpha = 0.5)+
  ggtitle("Density chart of cpiml_l candidates Valid vote in Election Cast wise")
fig <- ggplotly(p)
fig

#scatter chart age with votes in total
fig <- plot_ly(data = cpiml_l, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(title = 'Male and Female total vote share in Number for cpiml_l'
)
fig

fig <- plot_ly(data = cpiml_l, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Category`,colors = "Set1")
fig <- fig %>% layout(title = 'CastWise total vote share in Number for cpiml_l'
)
fig

#size
fig <- plot_ly(data = cpiml_l, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Category`,colors = "Set1",size = ~`Total Valid Votes`)
fig <- fig %>% layout(title = 'CastWise total vote share in Number for cpiml_l'
)
fig

#
fig <- plot_ly(data = cpiml_l, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Sex`,colors = "Set1",size = ~`Total Valid Votes`)
fig <- fig %>% layout(title = 'Male and Female total vote share in Number for cpiml_l'
)
fig