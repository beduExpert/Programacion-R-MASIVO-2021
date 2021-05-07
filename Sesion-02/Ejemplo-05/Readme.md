# Ejemplo 5. Funciones `apply`, `lapply` y `do.call`

#### Objetivo

- Realizar operaciones por filas o columnas en un arreglo
- Aplicar funciones a elementos de vectores o listas y obtener una lista con los resultados
- Combinar múltiples data frames en un único data frame con la ayuda de funciones de una manera fácil y rápida

#### Requisitos

- Conocer lo básico sobre vectores, matrices y data frames
- Saber obtener una comprensión de data frames de una manera fácil y rápida con ayuda de funciones como `str` y `head`

#### Desarrollo

#### Función `apply`

La función `apply` regresa un vector, arreglo o lista de valores obtenidos al aplicar una función a los márgenes de un arreglo o matriz. Por ejemplo

```R
X <- matrix(1:49, ncol = 7)
X
apply(X, 1, mean) # cálculo de la media para las filas
apply(X, 2, median) # cálculo de la mediana para las columnas
```

#### Función `lapply`

La función `lapply` se usa de la siguiente manera `lapply(X, FUN, ...)` donde `X` puede ser un vector o una lista, `FUN` es una función que será aplicada a cada elemento de `X` y `...` representa argumentos opcionales para `FUN`. `lapply` regresa una lista de la misma longitud que `X`, en donde cada elemento de la lista es el resultado de aplicar `FUN` al elemento que corresponde de `X`.

Vamos a utilizar `lapply` para leer un conjunto de archivos csv de manera consecutiva y "rápida", para esto debemos especificar un directorio de trabajo y descargar los archivos csv en nuestro directorio, por ejemplo, puede crear la carpeta soccer para descargar los datos

```R
u1011 <- "https://www.football-data.co.uk/mmz4281/1011/SP1.csv"
u1112 <- "https://www.football-data.co.uk/mmz4281/1112/SP1.csv"
u1213 <- "https://www.football-data.co.uk/mmz4281/1213/SP1.csv"
u1314 <- "https://www.football-data.co.uk/mmz4281/1314/SP1.csv"

download.file(url = u1011, destfile = "SP1-1011.csv", mode = "wb")
download.file(url = u1112, destfile = "SP1-1112.csv", mode = "wb")
download.file(url = u1213, destfile = "SP1-1213.csv", mode = "wb")
download.file(url = u1314, destfile = "SP1-1314.csv", mode = "wb")
```

podemos visualizar el nombre de los archivos descargados en un vector de strings de la siguiente manera

```R
dir()
```

podemos leer con una sola instrucción los archivos descargados usando la función `lapply` de la siguiente manera

```R
lista <- lapply(dir(), read.csv) # Guardamos los archivos en lista
```

los elementos de `lista` son los archivos csv leidos y se encuentran como data frames

```R
lista <- lapply(lista, select, Date:FTR) # seleccionamos solo algunas columnas de cada data frame
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); head(lista[[4]])
```

cada uno de los data frames que tenemos en `lista`, los podemos combinar en un único data frame utilizando las funciones `rbind` y `do.call`
de la siguiente manera

#### Función do.call

```R
data <- do.call(rbind, lista)
head(data)
dim(data)
```
