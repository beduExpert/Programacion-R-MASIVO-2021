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