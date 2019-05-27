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

    plot(Arrests$released)
    points(predictor,col="red",cex=20)

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
    response <- round(predictor, digits = 1)
    response
  })

})
