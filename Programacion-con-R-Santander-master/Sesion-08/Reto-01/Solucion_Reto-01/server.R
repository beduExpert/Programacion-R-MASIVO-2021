# Dashboard básico

library(shiny)


shinyServer(function(input, output) {
  
  output$output_text <- renderText( {paste("Gráfico de Sepal.Length ~", input$x)}) #Titulo del main Panel
  
  output$output_plot <- renderPlot( {plot(as.formula(paste("Sepal.Length ~", input$x)),  #Gráficos de salida
                                          data = iris) })
  
  output$summary <- renderPrint( {summary(iris)} )   # Summary
  
  output$table <- renderTable({ data.frame(iris)})   # Data Frame
  
  output$datatable <- renderDataTable( {iris},       #Data table
                                       options = list(aLengthMenu = c(10,20,50), iDisplayLength = 10) ) 
  
}
)
