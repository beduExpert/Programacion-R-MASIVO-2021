# Generación de un dashboard de tipo de selección Dinámica. Reto 2

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    datasetImput <- reactive(
        switch(input$dataset, 
               "airquality" = airquality[,1:4], 
               "diamonds" = as.data.frame(diamonds[,c("carat","depth", "price") ]), 
               "midwest" = as.data.frame(midwest[,4:26]) )
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


