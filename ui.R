library(shiny)

shinyUI(fluidPage(
  titlePanel("MPG Predictor"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("weight", "Car weight (1000 lbs):", min = 1.5, max = 5.5, value = 3, step = 0.1)
    ),
    
    mainPanel(
      h4("Predicted MPG:"),
      verbatimTextOutput("prediction")
    )
  )
))
p("This application predicts the miles per gallon (MPG) of a car based on its weight using a linear regression model trained on the mtcars dataset.")
