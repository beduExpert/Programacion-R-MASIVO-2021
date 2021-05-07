# Ejemplo 2. Creación de un Dashboard con pestañas y data tables

#### Objetivo
- Agregar pestañas al dashboard
- Agregar elementos

#### Requisitos
- Crear un dashboard simple

#### Desarrollo


Continuando con la base del ejemplo anterior, ahora lo que haremos es agregar imágenes dentro de nuestro panel en el archivo **`ui.R`**

```R
library(shiny)
shinyUI(
    pageWithSidebar(
        headerPanel("Aplicacion basica con Shiny"),
        sidebarPanel(
            p("Crear plots con el DF 'auto'"), 
            selectInput("x", "Seleccione el valor de X",
                        choices = names(mtcars))
        ),
        mainPanel(
                    h3(textOutput("output_text")), 
                    plotOutput("output_plot"), 
              
              #Agregamos una imágen
                    img( src = "cor_mtcars.png", 
                    height = 450, width = 450)
              
            )
        )
    )
    

```

Esto podemos organizarlo de mejor manera agregando pestañas con el comando `tabsetPanel` y con `tabPanel`para cada pestaña individual

```R
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
            
          
    #Agregando pestañ±as
    tabsetPanel(
        tabPanel("Plots",                   #Pestaña de Plots <---------
                 h3(textOutput("output_text")), 
                 plotOutput("output_plot"), 
        ),
        
        tabPanel("imágenes",                #Pestaña de imágenes  <---------
                 img( src = "cor_mtcars.png", 
                      height = 450, width = 450)
        ), 
        
        tabPanel("Summary", verbatimTextOutput("summary")),     # <--------- Summary
        tabPanel("Table", tableOutput("table")),                # <--------- Table
        tabPanel("Data Table", dataTableOutput("data_table"))   # <--------- Data table
    )
)
)

)



```

Ahora hay que agregar la información que desplegará cada una de esas pestañas en el archivo **`server.R`**

```R
library(shiny)

shinyServer(function(input, output) {

 output$output_text <- renderText(paste("mpg~", input$x))   #Título del main Panel
 
 #Gráficas                       <----------
 output$output_plot <- renderPlot( plot( as.formula(paste("mpg ~", input$x)),
                                          data = mtcars) )
 
  #imprimiendo el summary       <----------                                  
 output$summary <- renderPrint({
     summary(mtcars)
    })
     
 # Agregando el dataframe       <----------
 output$table <- renderTable({ 
     data.frame(mtcars)
     })
 
 #Agregando el data table       <----------
 output$data_table <- renderDataTable({mtcars}, 
                                      options = list(aLengthMenu = c(5,25,50),
                                                     iDisplayLength = 5))
                                    
       
})
```


El resultado final es algo similar a lo siguiente, se puede apreciar el data table donde se pueden realizar filtros simultáneos. 

<img src="imagenes/2.1.png" width="790" height="450">
