# Ejemplo 3. Dashboard dinámico

#### Objetivo
- Crear un dashboard de tipo dinámico utilizando gráficas de tipo histograma, además de seleccionar las variables mediante botones.

#### Requisitos
- Utilería shiny
- Generar un archivo de tipo Shiny webApp
- Conocimiento de data frames

#### Desarrollo

Generar la Shiny webApp y dentro del archivo `ui.R` pegar el siguiente código

```R
# Generación de un dashboard de tipo de selección dinámica

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
        mainPanel(plotOutput("plot")
        )
    )
))
```

Para el archivo `server.R` pega el siguiente código, además trata de identificar que hacen cada uno de los comandos que se presentan a continuación:

```R 
# Generación de un dashboard de tipo de selección dinámica

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

   datasetImput <- reactive(
       switch(input$dataset, 
              "rock" = rock, 
              "mtcars" = mtcars, 
              "iris" = iris)
   )

   output$var <- renderUI({
       
       radioButtons("varname", 
                    "elige una variable", 
                    names(datasetImput()))
   })
   
   output$plot <- renderPlot({
       if(!is.null(input$varname)){
           if(!input$varname %in% names(datasetImput())){
               colname <- names(datasetImput())[1]
               
           } else {
               colname <- input$varname
           }
       hist(datasetImput()[,colname],
            main = paste("Histograma de", colname), 
            xlab = colname)
           }
       
   })
   
    })

```
Ejecuta la webApp
