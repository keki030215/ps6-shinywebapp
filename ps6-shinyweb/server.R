library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)

setwd("~/Documents/info201wi23/assignments/ps6-shinywebapp/ps6-shinyweb/")
uah <- read_delim("UAH-lower-troposphere-long.csv.bz2")

server <- function(input, output) {
  output$sample_table <- renderTable({
    uah_sample <- uah %>% 
      mutate(time = year + month/100*(100/12)) %>% 
      sample_n(5)
    print(uah_sample)
  })
  output$plot <- renderPlotly({
    uah_plot <- uah %>% 
      filter(region %in% input$select_region) %>% 
      mutate(time = year + month/100*(100/12)) 
  p <- ggplot(uah_plot, aes(time, temp, col = region)) +
              geom_point(size = 0.5) +
              labs(x = "Year", y = "Temperature", col = "Region") +
              xlim(input$year_range[1], input$year_range[2]) +
    if (input$color_palette == "Palette 2"){
      scale_color_brewer(palette = "Dark2")
    }
  ggplotly(p, height = 500, width = 700)
  })
  output$plot_text1 <- renderText({
    paste("Time period is from", input$year_range[1],
        "to", input$year_range[2])
  })
  output$plot_text2 <- renderText({
    uah_plot_text <- uah %>% 
      filter(region %in% input$select_region)
    paste("There is", nrow(uah_plot_text), "observarions.\n")
  })
  output$table <-renderDataTable({
    var <- input$variable
    if(var == "year"){
      uah_table <- uah %>% 
        group_by(year) %>% 
        reframe(ave_temp = round(mean(temp), 4))
    }
    else{
      if(var == "month"){
        uah_table <- uah %>% 
          group_by(year, month) %>% 
          reframe(ave_temp = round(mean(temp), 4))
      }
      else{
        if(var == "region"){
          uah_table <- uah %>% 
            group_by(region) %>% 
            reframe(ave_temp = round(mean(temp), 4))
        }
      }
    }
  })
  output$table_text <- renderText({
    var <- input$variable
    if(var == "year"){
      uah_table <- uah %>% 
        group_by(year) %>% 
        reframe(ave_temp = round(mean(temp), 4))
      paste("The table has", n_distinct(uah$year), "years' data, and 
             the temperature range is from", min(uah_table$ave_temp),
            "to", max(uah_table$ave_temp), ".\n")
    }else{
      if(var == "month"){
        uah_table <- uah %>% 
          group_by(year, month) %>% 
          reframe(ave_temp = round(mean(temp), 4))
        paste("The table has", nrow(uah_table), "months' data, and 
             the temperature range is from", min(uah_table$ave_temp),
              "to", max(uah_table$ave_temp), ".\n")
      }else{
        if(var == "region"){
          uah_table <- uah %>% 
            group_by(region) %>% 
            reframe(ave_temp = round(mean(temp), 4))
          paste("The table has", nrow(uah_table), "regions' data, and 
             the temperature range is from", min(uah_table$ave_temp),
                "to", max(uah_table$ave_temp), ".\n")
        }
      }
    }
  })
}
shinyServer(server)