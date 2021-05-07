# Reto 3.

# Descargue los archivos csv que corresponden a las temporadas 2017/2018, 2018/2019, 2019/2020 y 2020/2021 
# de la Bundesliga 1 y que se encuentran en el siguiente enlace https://www.football-data.co.uk/germanym.php

# Importe los archivos descargados a R

# Usando la función select del paquete dplyr, seleccione únicamente las columnas Date, HomeTeam, AwayTeam,
# FTHG, FTAG y FTR

# Combine cada uno de los data frames en un único data frame con ayuda de las funciones rbind y do.call

# Solución

# Primero podemos establecer un directorio de trabajo en donde se descargarán nuestros datos

suppressWarnings(suppressMessages(library(dplyr)))

# Ahora guardamos como cadena de caracteres los enlaces de los archivos que nos interesan

B1.2021 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"
B1.1920 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
B1.1819 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
B1.1718 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"

# Con ayuda de la función `download.file` descargamos los archivos en el directorio previamente elegido

download.file(url = B1.2021, destfile = "B1.2021.csv", mode = "wb")
download.file(url = B1.1920, destfile = "B1.1920.csv", mode = "wb")
download.file(url = B1.1819, destfile = "B1.1819.csv", mode = "wb")
download.file(url = B1.1718, destfile = "B1.1718.csv", mode = "wb")

# Importamos los datos a R

lista <- lapply(list.files(), read.csv)

# Seleccionamos únicamente las columnas de interés

lista <- lapply(lista, select, Date, HomeTeam:FTR)

data <- do.call(rbind, lista)
head(data); tail(data)

