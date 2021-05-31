# Ejemplo 3. Listas y data frames

# Objetivo

- Crear listas y data frames
- Extraer información de estos
- Cálculo de estadísticos básicos

# Requisitos

1. Haber estudiado el prework
2. Tener previamente instalados R y RStudio

# Desarrollo
Ejecutar las líneas de comando y tratar de comprender qué realiza cada parte de sus entradas

#### Listas 
```R
(milista <- list(nombre = "Pepe", no.hijos = 3, edades.hijos = c(4, 7, 9)))
```
Propiedades de la lista
```R
str(milista)
```
Extrayendo elementos de la lista, recuerda que para ingresar se debe usar el símbolo `$` 
```
milista$nombre
```

Creando data frames
```R
(x <- 10:21)
(y <- letters[x])

(mydf <- data.frame(edad=x, grupo=y))

str(mydf)
```

Extrayendo información del df, se hace igual que con las matrices
```R
mydf[1]
mydf[,1]
mydf$edad
```
Calculando algunos estadísticos básicos
```R
mean(mydf$edad)
```

Podemos hacer uso de la función `paste` para agregar un mensaje
```R
paste("La media de la edad es:", mean(mydf$edad))
```

Podemos inspeccionar a detalle el df utilizando `summary`
```R
summary(mydf)
```
También se puede conocer su dimensión 
```R
dim(mydf)
```
Podemos agregar una columna extra con datos 
```RR
mydf$sexo <-c("H", "M", "H", "M", "H", "H", "M", "H","H","M", "M")
mydf
summary(mydf)
```

Si fuera el caso, se puede eliminar una columna 
```R
mydf$sexo <- NULL
mydf
```
