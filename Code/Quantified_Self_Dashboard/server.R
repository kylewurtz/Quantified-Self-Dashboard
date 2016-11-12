  #
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
require(DT)
require(tidyverse)
require(rprojroot)

setwd(rprojroot::find_root("Quantified Self Dashboard.Rproj"))
days = read_csv("Data/Input/days_16.csv")
pomodoros = read_csv("Data/Input/pomodoros_16.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  output$dt_days = DT::renderDataTable({
    DT::datatable(days)
  })
  
  output$dt_pomodoros = DT::renderDataTable({
    DT::datatable(pomodoros)
  })
  
})
