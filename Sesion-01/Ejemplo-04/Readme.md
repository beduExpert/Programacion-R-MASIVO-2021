# EJEMPLO 4. Descarga y lectura de data sets.

# Objetivo
- Fijar y conocer ruta de trabajo
- Lectura de ficheros CSV, locales y en repositorio
- Manejo de objetos

# Requisitos
1. R, RStudio
2. Prework

# Desarrollo
Ejecutar las líneas de comando y tratar de comprender que realiza cada parte de sus entradas
#### Se pueden obtener diversos data sets de Kaggle, visita el sitio para que te familiarices
#### La siguiente es una base de datos de los libros más vendidos en Amazon del 2009 - 2019

Obtenemos la ruta del directorio de trabajo
```R
getwd()
```
Fijando el directorio de trabajo
```R
setwd("c:/Users/User/Documents/Bedu/") # Depende del usuario
```
La función `read.csv` será util para leer fichero .csv
```R
read.csv("bestsellers with categories.csv") # El archivo csv debe estar en el directorio de trabajo
```
se puede asignar a un objeto el fichero leido anteriormente
```R
amazon.books <- read.csv("bestsellers with categories.csv")
tail(amazon.books); str(amazon.books)
```
También se puede leer el fichero directamente desde una URL
```R
data.url <- read.csv("https://www.football-data.co.uk/mmz4281/2021/SP1.csv")
tail(data.url); str(data.url)
```
Calculamos la dimensión de la base de datos
```R
dim(amazon.books)
```

El tipo de objeto se puede saber utilizando class() 
```R
class(amazon.books)
```
