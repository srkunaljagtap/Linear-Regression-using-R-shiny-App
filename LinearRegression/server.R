

library(shiny)

shinyServer(function(input, output) {
  
  inputData<-reactive({
    
    inFile <- input$data
    
    if (is.null(inFile))
      return(NULL)
   
   file <- read.csv(inFile$datapath, header = input$header,
             sep = input$sep, quote = input$quote)
        
  })
    
 output$table <- renderTable({
   inFile <- input$data
   
   if(input$default == T) 
   {
     x <- rnorm(input$obs, 0, 2)
     y <- 2 + x + rnorm(input$obs, 0, 1)
    file <- cbind(x,y)
     
   }
     else
     {
       if(is.null(input$data))  {
         return(NULL)
       } 
   file <- read.csv(inFile$datapath, header = input$header,
                    sep = input$sep, quote = input$quote)
    
   file<- file[1:input$obs,]
     }
  })
 
 
 
 output$plot <- renderPlot({
   
   inFile <- input$data
   
   if(input$default == T) 
   {
     x <- rnorm(input$obs, 0, 2)
     y <- 2 + x + rnorm(input$obs, 0, 1)
     file <- cbind(x,y)
     
   }
   else {
     if(is.null(input$data))    
   return(NULL) 
   file <- read.csv(inFile$datapath, header = input$header,
                    sep = input$sep, quote = input$quote)
   
   file<- file[1:input$obs,]
   x<- file[,1]
   y<- file[,2]
 } 



   a<- input$intercept
   b<-input$slope
#    
#    yhat <- input$intercept + x * input$slope
    regression <- lm(x~y)
  intercept1<- coef(regression)["(Intercept)"] 
   slope<- coef(regression)["y"] 
#   
   
 plot(x, y, cex = 1, font = 3)
 points(x, y, pch = 16, cex = 0.8, col = "red",,xlab = "Explanatory Variable",ylab = "Outcome Variable")
title("Linear Regression")
#geom_abline(intercept = intercept1, slope = slope, colour = "red", size = 2) 
 
})
 


 output$LinearPlot <- renderPlot({
   
   inFile <- input$data
   
   
   if(input$default == T) 
   {
     x <- rnorm(input$obs, 0, 2)
     y <- 2 + x + rnorm(input$obs, 0, 1)
     file <- cbind(x,y)
     
   }
   else {
     
   if(is.null(input$data))     
     return(NULL) 
   file <- read.csv(inFile$datapath, header = input$header,
                    sep = input$sep, quote = input$quote)
   
   file<- file[1:input$obs,]
   x<- file[,1]
   y<- file[,2]
   }
   
   
   par(mfrow=c(2,2))
   plot(lm(x~y),col.axis = "blue") 
   points(x, y, pch = 16, cex = 0.8, col = "red")
 })
 
 
 
 output$summary <-renderPrint({
   inFile <- input$data
   
   
   if(input$default == T) 
   {
     x <- rnorm(input$obs, 0, 2)
     y <- 2 + x + rnorm(input$obs, 0, 1)
     file <- cbind(x,y)
     
   }
   else {
   
   
   if(is.null(input$data))     
    return()
   
   
   file <- read.csv(inFile$datapath, header = input$header,
                    sep = input$sep, quote = input$quote)
   
   file<- file[1:input$obs,]
   }
   
   
   summary(file)
   
 })
 
 
 output$Linearsummary <-renderPrint({
   inFile <- input$data
   
   
   if(input$default == T) 
   {
     x <- rnorm(input$obs, 0, 2)
     y <- 2 + x + rnorm(input$obs, 0, 1)
     file <- cbind(x,y)
     
   }
   else {
   
   if(is.null(input$data))     
     return()
   
   file <- read.csv(inFile$datapath, header = input$header,
                    sep = input$sep, quote = input$quote)
   
   file<- file[1:input$obs,]
   x<- file[,1]
   y<- file[,2]
   }
   
   
   
   summary(lm(x~y))
   
 })
 
 
 
 
 
 
 
})