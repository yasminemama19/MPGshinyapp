library(shiny)

shinyUI(fluidPage(
  
  # Titre de l'application
  titlePanel("Prédiction de la consommation de carburant (MPG)"),
  
  # Disposition en deux colonnes : input (gauche) et output (droite)
  sidebarLayout(
    sidebarPanel(
      # Choix du poids de la voiture
      sliderInput("wt", 
                  "Poids de la voiture (en milliers de livres) :", 
                  min = 1.5, 
                  max = 5.5, 
                  value = 3,
                  step = 0.1),
      
      # Choix du nombre de cylindres
      selectInput("cyl", 
                  "Nombre de cylindres :", 
                  choices = c(4, 6, 8), 
                  selected = 4)
    ),
    
    mainPanel(
      # Résultat de la prédiction
      h3("Résultat de la prédiction"),
      verbatimTextOutput("predicted_mpg"),
      
      # Affichage du graphique
      plotOutput("plot"),
      
      # Instructions pour l'utilisateur
      h4("Instructions d'utilisation"),
      p("1. Sélectionnez le poids de la voiture avec le curseur."),
      p("2. Choisissez le nombre de cylindres."),
      p("3. Le MPG (miles par gallon) estimé s'affichera."),
      p("4. Le point rouge sur le graphique représente la prédiction.")
    )
  )
))
