#load data
library(readxl)
Detailed_Results <- read_excel("data/Detailed Results.xlsx", 
                               skip = 2)

library(DT)
datatable(Detailed_Results)


#gender analysis
Detailed_Results$`Candidate Sex factor` <- as.factor(Detailed_Results$`Candidate Sex`)

ggplot(Detailed_Results,aes(x=`Candidate Sex factor`,fill=`Candidate Sex factor`))+
  geom_bar( )+
  labs(x = "Gender of Candidate",
       y = "count " ) +
  ggtitle("Gender analysis of candidates")

#pie chart
library(plotly)
library(dplyr)



df <-Detailed_Results
df <- df %>% group_by(`Candidate Sex`)
df <- df %>% summarize(count = n())
fig <- df %>% plot_ly(labels = ~`Candidate Sex`, values = ~count)
fig <- fig %>% add_pie(hole = 0.6)
fig <- fig %>% layout(title = "chart of gender analysis",  showlegend = F,
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

fig






#ST st gen
df <- Detailed_Results[,c(1,6)]
df<-unique(df)
datatable(df)
df <- df[!df$`Candidate Category` == "", ] 
df<-unique(df)
datatable(df)
df <- df %>% filter(`Candidate Category`!="")

#with known values
ggplot(df,aes(x=`Candidate Category`,fill=`Candidate Category`))+
  geom_bar( )+
  labs(x = "Cast of Candidate",
       y = "count " ) +
  ggtitle("Cast analysis of candidates")

#sex and cast
df <- Detailed_Results[,c(1,6,4)]
df<-unique(df)
datatable(df)
df <- df %>% filter(`Candidate Category`!="")
datatable(df)

ggplot(df,aes(x=`Candidate Category`,fill=`Candidate Category`))+
  geom_bar( )+
  labs(x = "Cast of Candidate",
       y = "count " ) +
  ggtitle("Cast analysis of candidates with gender division")+
  facet_wrap(~`Candidate Sex`)

p <- ggplot(data=df, aes(x=factor(1), stat="bin", fill=`Candidate Category`)) + geom_bar(position="fill") # Stacked bar chart
p <- p + ggtitle("cast and gender of candidate") + xlab("") + ylab("Gender") # Adds titles
p <- p + facet_grid(facets=. ~ `Candidate Sex`) # Side by side bar chart
p <- p + coord_polar(theta="y") # side by side pie chart
p

#see the data
datatable(Detailed_Results)

df <- Detailed_Results[,c(2,7)]
datatable(df)

#tmc
tmc <- Detailed_Results %>% filter(`Party Name`=="AITC")
datatable(tmc)

p <- ggplot(tmc, aes(`Candidate Age`,fill=`Candidate Sex`)) + geom_density(alpha = 0.5)+ggtitle("Density chart of Tmc candidates age")
fig <- ggplotly(p)
fig

#stacked density
library(plotly)
set.seed(123)
p <- ggplot(tmc, aes(`Candidate Age`, fill = `Candidate Sex`)) + 
  geom_density(alpha = 0.5, position = "stack") + 
  ggtitle("stacked density chart of Tmc candidates age")
fig <- ggplotly(p)
fig

#STatterplot
p <- ggplot(tmc, aes(`Candidate Age`,rnorm(293))) + 
  geom_point(alpha = 0.5) + 
  geom_density_2d() + 
  theme(panel.background = element_rect(fill = '#ffffff')) +
  labs(x="Age of Tmc Candidate",
       y = "Contour value")+
  ggtitle("2D density plot with STatterplot overlay of TMC Candidates with Age")
fig <- ggplotly(p)
fig

#sexual distribution 
fig <- tmc %>% plot_ly(x=~`Candidate Sex`,color=~`Candidate Category`)
fig <- fig %>% layout(title = 'Male and Female seat distribution of TMC Based on Cast'
                      )
fig

#gender biasness
fig <- tmc %>% plot_ly(x=~`Candidate Sex`,color=~`Candidate Sex`)
fig <- fig %>% layout(title = 'Male and Female seat distribution of TMC'
)
fig

#votes
p <- ggplot(tmc, aes(`VALID VOTES POLLED in General`,fill=`Candidate Sex`)) +
  geom_density(alpha = 0.5)+
  ggtitle("Density chart of Tmc candidates Valid vote in Election gender wise")
fig <- ggplotly(p)
fig

p <- ggplot(tmc, aes(`VALID VOTES POLLED in General`)) +
  geom_density(alpha = 0.5,fill="green")+
  ggtitle("Density chart of Tmc candidates Valid vote in Election")
fig <- ggplotly(p)
fig

p <- ggplot(tmc, aes(`VALID VOTES POLLED in General`,fill=`Candidate Category`)) +
  geom_density(alpha = 0.5)+
  ggtitle("Density chart of Tmc candidates Valid vote in Election Cast wise")
fig <- ggplotly(p)
fig

#STatter chart age with votes in total
fig <- plot_ly(data = tmc, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(title = 'Male and Female total vote share in Number for TMC'
)
fig

fig <- plot_ly(data = tmc, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Category`,colors = "Set1")
fig <- fig %>% layout(title = 'CastWise total vote share in Number for TMC'
)
fig

#size
fig <- plot_ly(data = tmc, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Category`,colors = "Set1",size = ~`Total Valid Votes`)
fig <- fig %>% layout(title = 'CastWise total vote share in Number for TMC'
)
fig

#
fig <- plot_ly(data = tmc, x = ~`Candidate Age`, y = ~`Total Valid Votes`,color =~`Candidate Sex`,colors = "Set1",size = ~`Total Valid Votes`)
fig <- fig %>% layout(title = 'Male and Female total vote share in Number for TMC'
)
fig


#see results of some area
jadavpur <- Detailed_Results %>% filter(`Constituency Name`=="Jadavpur")

fig <- plot_ly(jadavpur, x = ~`Party Name`, y = ~`Total Valid Votes`, type = 'bar', color = ~`Party Name`)
fig <- fig %>% layout(title = "Result of Jadavpur Constituency",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain"))

fig

fig <- plot_ly(jadavpur, labels = ~`Party Name`, values = ~`Total Valid Votes`, type = 'pie')
fig <- fig %>% layout(title = "Result of Jadavpur Constituency",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain"))

fig


Kaliaganj <- Detailed_Results %>% filter(`Constituency Name`=="Kaliaganj")
fig <- plot_ly(Kaliaganj, labels = ~`Party Name`, values = ~`Total Valid Votes`, type = 'pie',textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste('$', `Total Valid Votes`),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
fig <- fig %>% layout(title = "Result of kaliyaganj Constituency",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain"))

fig


Maldaha <- Detailed_Results %>% filter(`Constituency Name`=="Maldaha")
fig <- plot_ly(Maldaha, labels = ~`Party Name`, values = ~`Total Valid Votes`, type = 'pie',textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste(`Total Valid Votes`),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
fig <- fig %>% layout(title = "Result of Maldha Constituency",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain"))

fig

#nota analysis
nota <- Detailed_Results %>% filter(`Party Name`=="NOTA")
datatable(nota)

nota_n<-arrange(nota,deST(`Total Valid Votes`))
df<-nota_n[c(1:5),]

fig <- plot_ly(df, x = ~`Constituency Name`, y = ~`Total Valid Votes`, type = 'bar', color = ~`Constituency Name`)
fig <- fig %>% layout(title = "NOTA WINNER  Constituency",
                      xaxis = list(title = "CONSTITUENCY NAME"),
                      yaxis = list(title = "VOtes gain"))

fig

fig <- plot_ly(nota_n, x = ~`Constituency Name`, y = ~`Total Valid Votes`, type = 'bar', color = ~`Constituency Name`)
fig <- fig %>% layout(title = "NOTA WINNER  Constituency",
                      xaxis = list(title = "CONSTITUENCY NAME"),
                      yaxis = list(title = "VOtes gain"))

fig


#postal
fig <- plot_ly(Maldaha, labels = ~`Party Name`, values = ~`VALID VOTES POLLED in Postal`, type = 'pie',textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste(`VALID VOTES POLLED in Postal`),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
fig <- fig %>% layout(title = "Result of Maldha Constituency in postal",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain in postal"))

fig


fig <- plot_ly(Kaliaganj, labels = ~`Party Name`, values = ~`VALID VOTES POLLED in Postal`, type = 'pie',textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste(`VALID VOTES POLLED in Postal`),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
fig <- fig %>% layout(title = "Result of Kaliyaganj Constituency",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain"))

fig

fig <- plot_ly(jadavpur, labels = ~`Party Name`, values = ~`VALID VOTES POLLED in Postal`, type = 'pie',textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste(`VALID VOTES POLLED in Postal`),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE)
fig <- fig %>% layout(title = "Result of Maldha Constituency",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain"))

fig

nota_n<-arrange(nota,deST(`VALID VOTES POLLED in Postal`))
df<-nota_n[c(1:5),]
fig <- plot_ly(df, x = ~`Constituency Name`, y = ~`VALID VOTES POLLED in Postal`, type = 'bar', color = ~`Constituency Name`)
fig <- fig %>% layout(title = "NOTA WINNER  Constituency in postal",
                      xaxis = list(title = "CONSTITUENCY NAME"),
                      yaxis = list(title = "VOtes gain"))

fig

fig <- plot_ly(nota_n, x = ~`Constituency Name`, y = ~`VALID VOTES POLLED in Postal`, type = 'bar', color = ~`Constituency Name`)
fig <- fig %>% layout(title = "NOTA WINNER  Constituency in postal",
                      xaxis = list(title = "CONSTITUENCY NAME"),
                      yaxis = list(title = "VOtes gain"))

fig

#some interesting graph
strong_50 <- Detailed_Results %>% filter(`VALID VOTES POLLED in General`>100000)
fig <- plot_ly(strong_50,x=~`Constituency Name`,y=~`VALID VOTES POLLED in General`,type="bar",color = ~`Party Name`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig

#cpm
strong_50_cpm <- strong_50 %>% filter(`Party Name`=="CPM")
fig <- plot_ly(strong_50_cpm,x=~`Constituency Name`,y=~`VALID VOTES POLLED in General`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig

#tmc
strong_50_tmc <- strong_50 %>% filter(`Party Name`=="AITC")
fig <- plot_ly(strong_50_tmc,x=~`Constituency Name`,y=~`VALID VOTES POLLED in General`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig

#INC
strong_50_con <- strong_50 %>% filter(`Party Name`=="INC")
fig <- plot_ly(strong_50_con,x=~`Constituency Name`,y=~`VALID VOTES POLLED in General`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig

#others
strong_50_oth <- strong_50 %>% filter(`Party Name`!="INC" & `Party Name`!="AITC" & `Party Name`!="CPM")
fig <- plot_ly(strong_50_oth,x=~`Constituency Name`,y=~`VALID VOTES POLLED in General`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig

Eng <- Detailed_Results %>% filter(`Constituency Name`=="Englishbazar")
fig <- plot_ly(Eng, labels = ~`Party Name`, values = ~`Total Valid Votes`, type = 'pie')
fig <- fig %>% layout(title = "Result of Englishbazar Constituency",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "VOtes gain"))

fig

#bjp winning seat
bjp <- Detailed_Results %>% filter(`Party Name`=="BJP" & `VALID VOTES POLLED in General`>60000)
fig <- plot_ly(bjp,x=~`Constituency Name`,y=~`VALID VOTES POLLED in General`,type="bar",color = ~`Candidate Category`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig

#strong ST candidates of cpm
cpm_ST <- Detailed_Results %>% filter(`Party Name`=="CPM" & `Candidate Category`=="ST" & `Total Valid Votes`>80000)
fig <- plot_ly(cpm_ST,x=~`Constituency Name`,y=~`Total Valid Votes`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig <- fig %>% layout(title="Votes Gained in ST seats by cpm candidate (over 80k votes)")
fig

#strong ST candidates of INC
inc_ST <- Detailed_Results %>% filter(`Party Name`=="INC" & `Candidate Category`=="ST" & `Total Valid Votes`>80000)
fig <- plot_ly(inc_ST,x=~`Constituency Name`,y=~`Total Valid Votes`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig <- fig %>% layout(title="Votes Gained in ST seats by INC candidate (over 80k votes)")
fig

#strong ST candidates of TMC
tmc_ST <- Detailed_Results %>% filter(`Party Name`=="AITC" & `Candidate Category`=="ST" & `Total Valid Votes`>90000)
fig <- plot_ly(tmc_ST,x=~`Constituency Name`,y=~`Total Valid Votes`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig <- fig %>% layout(title="Votes Gained in ST seats by TMC candidate (over 90k votes)")
fig


#strong st candidates of cpm
cpm_ST <- Detailed_Results %>% filter(`Party Name`=="CPM" & `Candidate Category`=="ST" & `Total Valid Votes`>60000)
fig <- plot_ly(cpm_ST,x=~`Constituency Name`,y=~`Total Valid Votes`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig <- fig %>% layout(title="Votes Gained in ST seats by cpm candidate (over 60k votes)")
fig

#strong st candidates of INC
inc_ST <- Detailed_Results %>% filter(`Party Name`=="INC" & `Candidate Category`=="ST" & `Total Valid Votes`>50000)
fig <- plot_ly(inc_ST,x=~`Constituency Name`,y=~`Total Valid Votes`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig <- fig %>% layout(title="Votes Gained in ST seats by INC candidate (over 50k votes)")
fig

#strong st candidates of TMC
tmc_ST <- Detailed_Results %>% filter(`Party Name`=="AITC" & `Candidate Category`=="ST" & `Total Valid Votes`>90000)
fig <- plot_ly(tmc_ST,x=~`Constituency Name`,y=~`Total Valid Votes`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig <- fig %>% layout(title="Votes Gained in ST seats by TMC candidate (over 90k votes)")
fig

#SUCI
df <- Detailed_Results %>% filter(`Party Name`=="SUCI")
df_filter <- Detailed_Results %>% filter(`Party Name`=="SUCI" & `Total Valid Votes`>10000)

#density plot
p <- ggplot(df_filter, aes(`VALID VOTES POLLED in General`,fill=`Candidate Category`)) +
  geom_density(alpha = 0.5)+
  ggtitle("Density chart of SUCI candidates Valid vote in Election Cast wise")
fig <- ggplotly(p)
fig

#strong hold of SUCI
fig <- plot_ly(df_filter,x=~`Constituency Name`,y=~`Total Valid Votes`,type="bar",color = ~`Candidate Sex`,colors = "Set1")
fig <- fig %>% layout(yaxis=list(title="% of vote STored"))
fig <- fig %>% layout(title="Votes Gained in strong SUCI places")
fig

#st seats
st <- 
