library(shiny)

model <- lm(mpg ~ wt, data = mtcars)

shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    weight <- input$weight
    pred <- predict(model, newdata = data.frame(wt = weight))
    round(pred, 2)
  })
})
