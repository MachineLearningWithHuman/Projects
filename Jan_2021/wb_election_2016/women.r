#Performance of women candidate of parties in wb 2016
library(readxl)
Performance_of_women_Candidates <- read_excel("data/Performance of women Candidates.xlsx", 
                                              skip = 1)

library(DT)
datatable(Performance_of_women_Candidates)

#Total Constituency number where women contested
length(unique(Performance_of_women_Candidates$`Constituency Name`))

#party wise women participence

fig <- plot_ly(Performance_of_women_Candidates, labels = ~`Party Name`, values = ~`Party Name`, type = 'pie',textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste(`Party Name`),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
fig <- fig %>% layout(title = "Women Candidates According to Party",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain"))

fig

ggplot(Performance_of_women_Candidates,aes(x=`Party Name`,fill=`Party Name`))+
  geom_bar( )+
  labs(x = "Name Of Party",
       y = "count " ) +
  ggtitle("Women Candidate analysis of parties")+
  ggsave("women1.png", width=12)

ggplot(Performance_of_women_Candidates,aes(x=`Status`,fill=`Status`))+
  geom_bar( )+
  labs(x = "Status",
       y = "count " ) +
  ggtitle("Women Candidate analysis ")


ggplot(Performance_of_women_Candidates,aes(x=`Party Type`,fill=`Party Type`))+
  geom_bar( )+
  labs(x = "Party Type",
       y = "count " ) +
  ggtitle("Women Candidate analysis based on Party Type ")

#cpm women
cpm <- Performance_of_women_Candidates %>% filter(`Party Name`=="CPM")

#status plot
ggplot(cpm,aes(x=`Status`,fill=Status))+
  geom_bar( )+
  labs(x = "Status",
       y = "count " ) +
  ggtitle("Women Candidate(CPM) analysis based on Status ")

#30% margin of cpm
cpm_30 <- cpm %>% filter(`% of Votes Secured Over Total Votes Poled`>=30)

p <- ggplot(cpm_30, aes(`% of Votes Secured Over Total Votes Poled`,fill=Status)) + geom_density(alpha = 0.5)+ggtitle("Density chart of cpm women candidates vote share")
fig <- ggplotly(p)
fig

#overall
p <- ggplot(Performance_of_women_Candidates, aes(`% of Votes Secured Over Total Votes Poled`,fill=Status)) + geom_density(alpha = 0.5)+
  ggtitle("Density chart of overall women candidates vote share")
fig <- ggplotly(p)
fig

usefull_vote <- Performance_of_women_Candidates %>% filter(`% of Votes Secured Over Total Votes Poled`>=20)
p <- ggplot(usefull_vote, aes(`% of Votes Secured Over Total Votes Poled`,fill=`Party Name`)) + geom_density(alpha = 0.5)+
  ggtitle("Density chart of overall women candidates vote share")
fig <- ggplotly(p)
fig

ggplot(usefull_vote,aes(x=`Party Name`,fill=`Party Name`))+
  geom_bar( )+
  labs(x = "Name Of Party",
       y = "count " ) +
  ggtitle("Women Candidate analysis of parties who got atleast 20% of vote share")

fig <- plot_ly(cpm_30,x=~`Candidate Name`,y=~`% of Votes Secured Over Total Votes Poled`,type="bar")
fig <- fig %>% layout(yaxis=list(title="% of vote scored"))
fig

fig <- plot_ly(cpm_30,x=~`Candidate Name`,y=~`% of Votes Secured Over Total Votes Poled`,type="bar",color = ~Status,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote scored"))
fig

fig <- plot_ly(cpm_30,x=~`Constituency Name`,y=~`% of Votes Secured Over Total Votes Poled`,type="bar",color = ~Status,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote scored"))
fig

#lost and vote share 40%
df <- Performance_of_women_Candidates %>% filter(`% of Votes Secured Over Total Votes Poled`>40 & Status=="L")

fig <- plot_ly(df,x=~`Constituency Name`,y=~`% of Votes Secured Over Total Votes Poled`,type="bar",color = ~`Party Name`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote scored"))
fig

#bjp loosing seats
df <- Performance_of_women_Candidates %>% filter(`Party Name`=="BJP" & Status=="L")
fig <- plot_ly(df,x=~`Constituency Name`,y=~`% of Votes Secured Over Total Votes Poled`,type="bar",color = ~`Constituency Name`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote scored"))
fig

