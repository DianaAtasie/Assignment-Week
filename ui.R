library(shiny)

shinyUI(fluidPage(

  titlePanel("Predictor of released"),

  sidebarLayout(
    sidebarPanel(
      h3(helpText("Select:")),
      numericInput("age", label = h4("Age"), step = 1, value = 20),
      numericInput("year", label = h4("Year"), step = 1, value = 1996),
      numericInput("checks", label = h4("Checks"), step = 1, value = 1),
      selectInput("colour", label = h4("Colour"),
                  choices = list("Black"="Black","White"="White")),
      selectInput("sex", label = h4("Sex"),
                  choices = list("Male"="Male","Female"="Female" )),
      selectInput("citizen", label = h4("Citizen"),
                  choices = list("Yes"="Yes","No"="No" )),
      selectInput("employed", label = h4("Employed"),
                  choices = list("Yes"="Yes","No"="No" ))
    ),

    mainPanel(
      plotOutput("distPlot"),
      h4("Predicted value for released is:"),
      h3(textOutput("result"))
    )
  )
))
