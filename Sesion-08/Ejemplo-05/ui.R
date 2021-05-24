# Ejemplo 3. Generación de un dashboard de tipo de selecciÃ³n DinÃ¡mica

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Elecciones dinámicas de Data Frames"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("dataset", "Selección del dataset", 
                        c("mtcars", "rock", "iris")), 
            uiOutput("var")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot")
        )
    )
))
