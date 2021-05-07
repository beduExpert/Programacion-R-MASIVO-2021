#Ejemplo 2. Normal con Labels  

library(shiny)
library(dplyr)
library(stringr)

shinyServer(function(input, output) {

 output$output_text <- renderText(paste("mpg~", input$x))
 
 #Gráficas  
 output$output_plot <- renderPlot({ plot( as.formula(paste("mpg ~", input$x)),
                                          data = mtcars) })

  #imprimiendo el summary                                  
 output$summary <- renderPrint({
   mtcars %>%  filter(str_detect(rownames(mtcars), 'Mer') & mpg >20 )
    })
     
 # Agregando el dataframe
 output$table <- renderTable({ 
     data.frame(mtcars)
     })
 
 #Agregando el data table
 output$data_table <- renderDataTable({mtcars}, 
                                      options = list(aLengthMenu = c(5,25,50),
                                                     iDisplayLength = 5))
                                    
       
})
