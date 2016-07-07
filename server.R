library(quantmod)
library(shiny)

shinyServer(
          function(input, output) {
                    dataInput <- reactive({
                             getSymbols(input$ticker, src= "yahoo", from = input$dates[1], to = input$dates[2], auto.assign=FALSE)
                    })
                    output$chart <- renderPlot({
                              date1 <- input$dates[1]
                              date2 <- input$dates[2]
                              chartSeries(dataInput(),name=input$ticker,TA=NULL)
                              addSMA(n=c(input$ma1,input$ma2),overlay=TRUE,col=c("red","yellow")) # choose moving averages
                    })
          })