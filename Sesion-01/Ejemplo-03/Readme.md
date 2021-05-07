# Ejemplo 3. Listas y data frames

# Objetivo

- Crear listas y data frames
- Extraer información de estos
- Cálculo de estadísticos básicos

# Requisitos

1. Prework
2. R, RStudio
3. Ejemplos 1 y 2

# Desarrollo

Seguir el contenido y tratar de comprender el código mostrado a continuación

#### Listas 
```R
(milista <- list(nombre = "Pepe", no.hijos = 3, edades.hijos = c(4, 7, 9)))
```

#propiedades de la lista
```R
str(milista)
```
Extrayendo elementos de la lista, recuerda que para ingresar se debe usar el símbolo `$` 
```
milista$nombre
```

Creando data frames
```R
x <- 6:8
y <- c("A", "B", "C")
(mifile <- data.frame(edad = x, grupo = y))

str(mifile)
```

Extrayendo información del df, se hace igual que con las matrices
```R
mifile[1]
mifile[,1]
mifile$edad
```
Calculando algunos estadísticos básicos
```R
mean(mifile$edad)
```

Podemos hacer uso de la función `paste` para agregar un mensaje
```R
paste("La media de la edad es:", mean(mifile$edad))
```

Podemos inspeccionar a detalle el df utilizando `summary`
```R
summary(mifile)
```
También se puede conocer su dimensión 
```R
dim(mifile)
```
Podemos agregar una columna extra con datos 
```RR
mifile$sexo <- c("H", "M", "H")
mifile
```

Si fuera el caso, se puede eliminar una columna 
```R
mifile$sexo <- NULL
mifile
```
