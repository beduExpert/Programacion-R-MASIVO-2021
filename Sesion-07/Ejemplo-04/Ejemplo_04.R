# Ejemplo 4. Lectura de archivos JSON, XML y tablas en HTML

# Comenzaremos instalando los paquetes necesarios para después cargarlos a R

# install.packages("rjson")   #Siempre usar comillas en el nombre del paquete

library(rjson)            # Quitar comillas del nombre

# Json
# Vamos a leer un archivo Json de prueba alojado aquí

URL <- "https://tools.learningcontainer.com/sample-json-file.json" # Asignando el link a una variable

JsonData <- fromJSON(file= URL)     # Se guarda el JSon en un objeto de R

class(JsonData)                     # Vemos que tipo de objeto es JsonData

str(JsonData)                       # Vemos la naturaleza de sus variables

# Finalmente ya que pudimos acceder al contenido del Json, también podemos 
# realizar la manipulación de los datos dentro del Json, por ejemplo:
  
sqrt(JsonData$Mobile)

# Para entrar a las demás variables recuerda que puedas usar el operador de $, 
# es decir, JsonData$

# XML
# Ahora vamos a leer datos XML en R, utilizando un archivo XML alojado aquí

# Lo primero es instalar y cargar el paquete XML y alojar el link en una variable 
# link, para su lectura

# install.packages("XML")
library(XML)
link <- "http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/xml/cd_catalog.xml"

# Analizando el XML desde la web
xmlfile <- xmlTreeParse(link)
# Ahora ya podemos ver las propiedades del objetvo xmlfile

summary(xmlfile)
head(xmlfile)
# También gracias al xmlTreeParse podemos extraer los datos contenidos en el archivo

#Extraer los valores xml
topxml <- xmlSApply(xmlfile, function(x) xmlSApply(x, xmlValue))

# Colocandolos en un Data Frame
xml_df <- data.frame(t(topxml), row.names= NULL)

str(xml_df) # Observar la naturaleza de las variables del DF
# Convertiremos incluso las variables de PRICE y YEAR en datos numéricos para 
# poder realizar operaciones con este dato

xml_df$PRICE <- as.numeric(xml_df$PRICE) 
xml_df$YEAR <- as.numeric(xml_df$YEAR)

mean(xml_df$PRICE)
mean(xml_df$YEAR)
# Todo esto se puede realizar en un solo paso utilizando el siguiente comando

data_df <- xmlToDataFrame(link)
head(data_df)

# Tablas en HTML
# Comenzamos instalando el paquete rvest el cual nos permitirá realizar la 
# lectura de la tabla en el HTML

# install.packages("rvest")
library(rvest)
# Introducimos una dirección URL donde se encuentre una tabla

theurl <- "https://solarviews.com/span/data2.htm"
file <- read_html(theurl)    # Leemos el html
# Selecciona pedazos dentro del HTML para identificar la tabla

tables <- html_nodes(file, "table")  
# Hay que analizar 'tables' para determinar cual es la posición en la lista 
# que contiene la tabla, en este caso es la no. 4

# Extraemos la tabla de acuerdo a la posición en la lista

table1 <- html_table(tables[4], fill = TRUE)

table <- na.omit(as.data.frame(table1))   # Quitamos NA´s que meten filas extras 
# y convertimos la lista en un data frame para su manipulación con R

str(table)  # Vemos la naturaleza de las variables
# Por último realizamos una conversión de una columna tipo chr a num, se pueden 
# hacer las conversiones que se requieran

table$Albedo <- as.numeric(table$Albedo)
str(table)
