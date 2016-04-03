library(ggplot2)
library(shiny)
library(datasets)
options(shiny.error=browser)
shinyServer(
  
  function(input, output){
    
    colm <- reactive({ 
      as.numeric(input$var)
      })
    output$text1 <- renderText({
      #colm = as.numeric(input$var)
      paste("Data setvariable/column name is", names(iris[colm()]))
      
    })
    
    output$text2 <- renderText({
      paste("Color of histogram is", input$color)
      
    })
    
    output$text3 <- renderText({
      paste("Number of histogram BINs is", input$bins)
      
    })
    
    output$sum <- renderPrint({
      summary(iris)
      
    })
    
    output$str <- renderPrint({
      str(iris)
      
    })
    output$data <- renderTable({
      #colm <- as.numeric(input$var)
      iris[colm()]
      #head(iris)
      
    })
    output$myhist <- renderPlot({
      #colm <- as.numeric(input$var)
      hist(iris[,colm()], breaks=seq(0, max(iris[,colm()]), length.out=input$bins+1),col=input$color, xlim=c(0, max(iris[,colm()])), main="Histogram of iris dataset", xlab=names(iris[colm()]))
    })
  }
)