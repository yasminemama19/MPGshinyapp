library(shiny)

# Modèle simple linéaire
data(mtcars)
model <- lm(mpg ~ wt + cyl, data = mtcars)

shinyServer(function(input, output) {
  
  predicted <- reactive({
    newdata <- data.frame(wt = input$wt, cyl = as.numeric(input$cyl))
    predict(model, newdata)
  })
  
  output$predicted_mpg <- renderPrint({
    paste("Consommation estimée:", round(predicted(), 2), "mpg")
  })
  
  output$plot <- renderPlot({
    plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl, pch = 19,
         xlab = "Poids (1000 lbs)", ylab = "MPG",
         main = "Relation poids / mpg")
    points(input$wt, predicted(), col = "red", pch = 19, cex = 2)
    legend("topright", legend = c("Prédiction utilisateur"), col = c("red"), pch = 19)
  })
})
