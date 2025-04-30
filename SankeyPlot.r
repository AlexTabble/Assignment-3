
install.packages('tidyverse')
install.packages('highcharter')
install.packages('htmlwidgets')
install.packages('webshot')

library('webshot')
library('tidyverse')
library('highcharter')
library('htmlwidgets')

webshot::install_phantomjs()

df <- read.csv('Reduced.csv')

df <- df |> select(
    Generation, Brand.Loyalty,Retention
)

Sankey <- hchart(data_to_sankey(df),'sankey',name='Sankey for BL and Gen') |>
hc_title(text='Generation to Retention by Brand Loyalty') |>
hc_subtitle(text='Retention of generations based of response to brand loyalty') |>
hc_caption(text='EDAB2714 Assignment 3')
Sankey


saveWidget(widget = Sankey,file = 'Sankey.html')

webshot(url='Sankey.html',file = 'SankeyImage.png',delay = 10)
