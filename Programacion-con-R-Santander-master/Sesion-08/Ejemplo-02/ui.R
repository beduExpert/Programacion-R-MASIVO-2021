#Ejemplo 2. Normal con Labels

library(class)
library(dplyr)
library(stringr)

library(shiny)
#install.packages("shinydashboard")
library(shinydashboard)

shinyUI(
    pageWithSidebar(
        headerPanel("Aplicacion básica con Shiny"),
        sidebarPanel(
            p("Crear plots con el DF 'auto'"), 
            selectInput("x", "Seleccione el valor de X",
                        choices = names(mtcars))
        ),
        mainPanel(
            
          
    #Agregando pestaÃ±as
    tabsetPanel(
        tabPanel("Plots",   #Pestaña de Plots
                 h3(textOutput("output_text")), 
                 plotOutput("output_plot"), 
        ),
        
        tabPanel("imágenes",  #Pestaña de imágenes
                 img( src = "cor_mtcars.png", 
                      height = 450, width = 450)
        ), 
        
        tabPanel("Dplyr", verbatimTextOutput("summary")),
        
        tabPanel("Table", tableOutput("table")),
        tabPanel("Data Table", dataTableOutput("data_table"))
    )
)
)

)

