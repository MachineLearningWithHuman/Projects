library(readxl)
Performance_of_Poltical_Parties <- read_excel("data/Performance of Poltical Parties.xlsx", 
                                              skip = 1)

datatable(Performance_of_Poltical_Parties)


party_type <- Performance_of_Poltical_Parties %>% group_by(`Party Type`) %>% summarise(Number=n())

fig <- plot_ly(party_type, labels = ~`Party Type`, values = ~Number, type = 'pie')
fig <- fig %>% layout(title = "Different Parties Participated in WB ELECTION(2016)",
                      xaxis = list(title = "Party type"),
                      yaxis = list(title = "Party type"))
fig


#performace of National parties

national_party <- Performance_of_Poltical_Parties %>%filter(`Party Type`=="N")

fig <- plot_ly(national_party, x = ~`Party Name`, y = ~Contested, type = 'bar',color=~`Party Name`)
fig <- fig %>% layout(title = "Different National Parties Participated in WB ELECTION(2016)",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "Party Contested"))
fig

#winning
fig <- plot_ly(national_party, x = ~`Party Name`, y = ~Won, type = 'bar',color=~`Party Name`)
fig <- fig %>% layout(title = "Different National Parties Winning Number in WB ELECTION(2016)",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "Party Winning Number"))
fig

#forfitted
fig <- plot_ly(national_party, x = ~`Party Name`, y = ~Forfitted, type = 'bar',color=~`Party Name`)
fig <- fig %>% layout(title = "Different National Parties Forfitted Number in WB ELECTION(2016)",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "Party Forfitted Number/'s"))
fig

#votes

fig <- plot_ly(national_party, labels = ~`Party Name`, values = ~Votes, type = 'pie')
fig <- fig %>% layout(title = "Different National Party VOTE %  in WB ELECTION(2016)",
                      xaxis = list(title = "Party type"),
                      yaxis = list(title = "Party type"))
fig

#votes scored overall

fig <- plot_ly(national_party, x = ~`Party Name`, y = ~`Votes in %`, type = 'bar',color=~`Party Name`,colors = "Set1")
fig <- fig %>% layout(title = "Different National Parties Votes in % over total votes in WB ELECTION(2016)",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "% share"))
fig

#votes scored in contested seats
fig <- plot_ly(national_party, x = ~`Party Name`, y = ~`VOTE % IN SEATS CONTESTED`, type = 'bar',color=~`Party Name`,colors = "Set1")
fig <- fig %>% layout(title = "Different National Parties Votes in % over contested votes in WB ELECTION(2016)",
                      xaxis = list(title = "Party Name"),
                      yaxis = list(title = "% share"))
fig


#unrecognised party
unrec_party <- Performance_of_Poltical_Parties %>%filter(`Party Type`=="U")

datatable(unrec_party)

unrec_10_party <- unrec_party %>% filter(Contested >=10)
