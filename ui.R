shinyUI(fluidPage(
          headerPanel("Stock Moving Average Crossover Study"), 
          sidebarPanel(
                    ##text
                    helpText("enter your stock ticker, the date range to display, the length (in days) of the two moving averages and then press the 'Update Chart' button"),
                    ## stock ticker
                    textInput("ticker", "Stock Ticker", "SPY"),
                    ## date range
                    dateRangeInput("dates", label = "Date Range","Date range", start = "2015-09-01",
                                   end = as.character(Sys.Date()), min = "2013-01-01", separator=" to ",
                                   startview="year"),
                    ## moving average inputs
                    numericInput(inputId="ma1", label = "Short Moving Average", value = 10, min = 5, max = 100, step = 1),
                    numericInput(inputId="ma2", label = "Long Moving Average", value = 20, min = 5, max = 200, step = 1),
                    submitButton('Update Chart')
          ),
          mainPanel(
                    plotOutput('chart'),
                    ## suggestion text
                    helpText("SPY is the ETF for the S&P 500. Other ideas: QQQ (Nasdaq ETF), GLD (gold), AAPL (Apple), TSLA (Tesla), CORN"),
                    helpText("For best results, use at least 6 months of data and enlarge to full screen"),
                    helpText("The longer your moving average, the more data history you will need. Some common moving averages used include 5/10/20/50/100"),
                    helpText("The most basic moving average crossover trading system views the crossover as a potential buy or sell signal")
          )
))