library(shiny)
library(ggplot2)
library(dplyr)
library(carData)
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({

    fit <- lm( released~., Arrests)

    predictor <- predict(fit, newdata = data.frame(colour = input$colour,
                                              year = input$year,
                                              sex = input$sex,
                                              age = input$age,
                                              employed=input$employed,
                                              citizen=input$citizen,
                                              checks=input$checks))
    x=head(Arrests,20)
   plot(rownames(x),x$released)
   points(round(predictor,0),col="red",cex=1)
  })
  output$result <- renderText({
    fit <- lm( released~., Arrests)
    predictor <- predict(fit, newdata = data.frame(colour = input$colour,
                                                   year = input$year,
                                                   sex = input$sex,
                                                   age = input$age,
                                                   employed=input$employed,
                                                   citizen=input$citizen,
                                                 checks=input$checks))
    if(round(predictor,0)==2) 
    response="Yes"
    else response="No"
    response
  })

})
