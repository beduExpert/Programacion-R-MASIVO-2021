# Ejemplo 5. Dashboard interactivo ejecutivo

#### Objetivo
- Generar un dashboard interactivo que tenga una presentación profesional y que pueda interactuar con varias variables

#### Requisitos
- Haber realizado los ejercicios anteriores
- Tener las librerías `shiny` y `shinydashboard`
- Analizar el código siguiente

#### Desarrollo
Se comenzará utilizando el código siguiente ahora en un solo archivo `app.R` a diferencia de los ejemplos anteriores esta webApp se correrá en un solo fichero para que puedas observar la diferencia entre ambas formas de realizar las webApps.

```R
## app.R ##

## Dashboard para el data set 'mtcars'

library(shiny)
library(shinydashboard)
#install.packages("shinythemes")
library(shinythemes)

#Esta parte es el análogo al ui.R
ui <- 
    
    fluidPage(
         
    dashboardPage(
        
    dashboardHeader(title = "Basic dashboard"),
    
    dashboardSidebar(
       
         sidebarMenu(
            menuItem("Histograma", tabName = "Dashboard", icon = icon("dashboard")),
            menuItem("Dispersión", tabName = "graph", icon = icon("area-chart")),
            menuItem("Data Table", tabName = "data_table", icon = icon("table")),
            menuItem("Imágen", tabName = "img", icon = icon("file-picture-o"))
                    )
        
    ),
    
    dashboardBody(

        tabItems(
            
            # Histograma
            tabItem(tabName = "Dashboard",
                    fluidRow(
                        titlePanel("Histograma de las variables del data set mtcars"), 
                        selectInput("x", "Seleccione el valor de X",
                                    choices = names(mtcars)),
                        
                        selectInput("zz", "Selecciona la variable del grid", 
                                
                                        choices = c("cyl", "vs", "gear", "carb")),
                        box(plotOutput("plot1", height = 250)),
                        
                             box(
                             title = "Controls",
                             sliderInput("bins", "Number of observations:", 1, 30, 15)
                        )
                    )
            ),
       
            # Dispersión
               tabItem(tabName = "graph", 
               fluidRow(
                   titlePanel(h3("Gráficos de dispersión")),
                   selectInput("a", "Selecciona el valor de x",
                               choices = names(mtcars)),
                   selectInput("y", "Seleccione el valor de y",
                               choices = names(mtcars)),
                   selectInput("z", "Selecciona la variable del grid", 
                               choices = c("cyl", "vs", "gear", "carb")),
                  box(plotOutput("output_plot", height = 300, width = 460) )
                   
               )
               ),
            
            
            
            tabItem(tabName = "data_table",
                    fluidRow(        
                        titlePanel(h3("Data Table")),
                        dataTableOutput ("data_table")
                    )
            ), 
            
            tabItem(tabName = "img",
                    fluidRow(
                        titlePanel(h3("Imágen de calor para la correlación de las variables")),
                        img( src = "cor_mtcars.png", 
                             height = 350, width = 350)
                    )
            )
            
            )
    )
)
)

#De aquí en adelante es la parte que corresponde al server

server <- function(input, output) {
library(ggplot2)
    
    #Gráfico de Histograma
    output$plot1 <- renderPlot({
       
        x <- mtcars[,input$x]
         bin <- seq(min(x), max(x), length.out = input$bins + 1)

          ggplot(mtcars, aes(x, fill = mtcars[,input$zz])) + 
             geom_histogram( breaks = bin) +
              labs( xlim = c(0, max(x))) + 
              theme_light() + 
              xlab(input$x) + ylab("Frecuencia") + 
              facet_grid(input$zz)
              
        
        })
    
    # Gráficas de dispersión
    output$output_plot <- renderPlot({ 
        
        ggplot(mtcars, aes(x =  mtcars[,input$a] , y = mtcars[,input$y], 
            colour = mtcars[,input$z] )) + 
            geom_point() +
            ylab(input$y) +
            xlab(input$x) + 
            theme_linedraw() + 
            facet_grid(input$z)  #selección del grid
        
        })   
    
    #Data Table
    output$data_table <- renderDataTable( {mtcars}, 
                                          options = list(aLengthMenu = c(5,25,50),
                                                         iDisplayLength = 5)
        )
   
}
    

shinyApp(ui, server)

```
