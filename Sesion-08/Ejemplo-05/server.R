# Ejemplo 3. Generación de un dashboard de tipo de selecciÃ³n DinÃ¡mica

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


