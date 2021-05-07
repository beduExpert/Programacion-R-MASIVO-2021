# Ejemplo 6. Funciones `na.omit` y `complete.cases`

#### Objetivo

- Tener una herramienta para identificar filas con valores perdidos (NA)
- Filtrar filas sin valores perdidos cuando estas se hallan identificados

#### Requisitos

- Tener conocimientos básicos para manipular data frames
- Saber filtrar filas de data frames

#### Desarrollo

Ahora vamos a considerar el conjunto de datos `airquality`, observamos primero algunas de sus filas

```R
head(airquality)
library(dplyr)
```

El tipo de objeto que es y el tipo de variables que contiene

```R
str(airquality)
```

observamos la dimensión

```R
dim(airquality)
```

Con la función `complete.cases` podemos averiguar cuales son aquellas filas que no contienen ningún valor perdido (`NA`) y cuales son aquellas filas que tienen al menos un valor perdido.

```R
bien <- complete.cases(airquality)
```

La variable `bien`, es un vector lógico con `TRUE` en las posiciones que representan filas de `airquality` en donde no hay `NA's` y con `FALSE` en las posiciones que representan aquellas filas de `airquality` en donde se encontraron `NA's`

Por tanto, podemos contar el número de filas en donde no hay `NA´s` de la siguiente manera

```R
sum(bien)
```

Podemos filtrar aquellas filas sin `NA's` de la siguiente manera

```R
airquality[bien,]
```

```R
data <- select(airquality, Ozone:Temp)
apply(data, 2, mean)
apply(data, 2, mean, na.rm = T)
```

`na.omit` devuelve el objeto con casos incompletos eliminados

```R
(m1 <- apply(na.omit(data), 2, mean))

b <- complete.cases(data)

(m2 <- apply(data[b,], 2, mean))

identical(m1, m2)
```
