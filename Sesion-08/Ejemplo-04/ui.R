#Condicional
library(shiny)


shinyUI(fluidPage(
    
    # Application title
    titlePanel("Elecciones condicionales"),
    
    # Sidebar with a slider input for number of bins
    sidebarPanel(
        selectInput("plot_type", "Tipo de Gráfica", 
                    c("Gráfica de dispersión" = "Scatter", 
                      "Histograma" = "histogram")) ,
        
        conditionalPanel(condition = "input.plot_type != 'histogram' ", 
                         selectInput("x", "Selecciona la variable en eje X", 
                                     choices = names(mtcars)
                         ))
        
        
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("plot")
    )
)
)