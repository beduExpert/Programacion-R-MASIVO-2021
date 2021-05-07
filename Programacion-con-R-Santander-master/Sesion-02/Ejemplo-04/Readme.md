# Ejemplo 4- Funciones `cbind`, `rbind` (manipulación de data frames)

#### Objetivo

- Combinar data frames (o arreglos) por columnas o por filas para formar un único data frame (o arreglo)

#### Requisitos

- Conocer lo básico sobre vectores, matrices y data frames en `R` y saber obtener una buena idea de los datos que conforman estos arreglos de una manera fácil y rápida mediante funciones como `str` y `head`

#### Desarrollo

#### Función `cbind`

La función `cbind` toma una sucesión de argumentos que pueden ser vectores, matrices o data frames y los combina por columnas, por ejemplo 

```R
cbind(1:10, 11:20, 21:30)
cbind(1:10, matrix(11:30, ncol =2))
cbind(data.frame(x = 1:10, y = 11:20), z = 21:30)
```

#### Función `rbind`

La función `rbind` funciona de manera similar a `cbind`, pero en lugar de combinar los objetos por columnas, los combina por filas, como ejemplo tenemos lo siguiente

```R
df1 <- data.frame(x = 1:5, y = 6:10, z = 16:20)
df2 <- data.frame(x = 51:55, y = 101:105, z = 151:155)
df1; df2
rbind(df1, df2)
```
