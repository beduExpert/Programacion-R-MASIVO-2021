# Ejemplo 4. Dashboard condicional

#### Objetivo.

Desarrollar un dashboard de tipo condicional para la selección de dos tipos de gráficas.

#### Requisitos
- Librería shiny
- Manejo de data frames
- Haber realizado los ejemplos anteriores

#### Desarrollo

Ahora lo que tendrás que hacer es dentro del archivo `ui.R` utilizar el siguiente código

```R
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
       
       conditionalPanel(condition = "input.plot_type != 'Scatter' ",
                        ),
       
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
```

Dentro del archivo `server.R` pegar el siguiente código y analizar que función desempeñan los inputs en este caso

```R
#Condicional

library(shiny)


shinyServer(function(input, output) {

 output$plot <- renderPlot({
    if (input$plot_type == "histogram") {
        hist(mtcars[,input$x], xlab =input$x, main = paste("Histograma de",input$x) )
        
 }  else  {
         plot(mtcars[,input$x], mtcars$hp, xlab = input$x, ylab = "hp")
 }      

 })
 
})
```


