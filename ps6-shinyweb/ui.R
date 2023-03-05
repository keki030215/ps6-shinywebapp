library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

setwd("~/Documents/info201wi23/assignments/ps6-shinywebapp/ps6-shinyweb/")
uah <- read_delim("UAH-lower-troposphere-long.csv.bz2")

ui <- fluidPage(
  titlePanel("UAH Lower Troposphere"), 
    mainPanel(
      tabsetPanel(
        tabPanel("Introduction",
                 h3("Brief Introfuction of The Dataset"),
                 p(em("The dataset is from UAH.")),
                 p("It includes four main variables:
                   year, month, temperature, and region."),
                 p("During data processing, another column of the table
                   called",
                   strong("time"), 
                   "is converted by mixing the year and month data."), 
                 p("The dataset measures the", 
                   strong("temperature deviation"), em("(deg C)"), 
                 "from", strong("1978-2023"), "average that are aggregated 
                   over a number of", strong("different regions.")),
                 p(em("Here is a small random sample set of the data.\n")),
                 tableOutput("sample_table")
                 ),
        tabPanel("Plot",
                 sidebarLayout(
                   sidebarPanel(
                     radioButtons("color_palette",
                                  "Select the color palette for the graph:",
                                  c("Palette 1", "Palette 2"), "Palette 1"),
                     sliderInput(
                       "year_range", "Select the range of year",
                       min(uah$year), max(uah$year), 
                       c(min(uah$year), max(uah$year))
                     ),
                     checkboxGroupInput(
                       "select_region", "Select region(s)",
                       choices = c( "globe", "globe_land", "globe_ocean", "nh", "nh_land",   
                                    "nh_ocean", "sh", "sh_land", "sh_ocean", "trpcs",       
                                    "trpcs_land", "trpcs_ocean", "noext", "noext_land", "noext_ocean",
                                    "soext", "soext_land", "soext_ocean", "nopol", "nopol_land",  
                                    "nopol_ocean", "sopol", "sopol_land", "sopol_ocean", "usa48",      
                                    "usa49", "aust"),
                       selected = "globe")
                     ),
                   mainPanel(
                     textOutput("plot_text1"),
                     textOutput("plot_text2"),
                     plotlyOutput("plot")
                   )
                  )
                 ),
        tabPanel("Table",
                 sidebarLayout(
                   sidebarPanel(
                     p("This table display average temperature over
                       the variable you choose."),
                     p("Here is a line summarize the data 
                       based on your selection."),
                     radioButtons("variable", 
                                 "Select average temperature depends on:",
                                 c("year", "month", "region"), "year")
                   ),
                   mainPanel(
                     textOutput("table_text"),
                     dataTableOutput("table")
                   )
                 )
        ),
      )
    )
  )
shinyUI(ui)