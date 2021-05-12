# Ejemplo 3. Listas y data frames

# Objetivo
# Crear listas y data frames
# Extraer información de estos
# Cálculo de estadísticos básicos

# Requisitos

# Prework
# R, RStudio
# Ejemplos 1 y 2

# Desarrollo

# Seguir el contenido y tratar de comprender el código mostrado a continuación

# Listas

(milista <- list(nombre = "Pepe", no.hijos = 3, edades.hijos = c(4, 7, 9)))

# propiedades de la lista

str(milista)

# Extrayendo elementos de la lista, recuerda que para ingresar se debe usar el símbolo $
  
milista$nombre

# Creando data frames

(x <- 10:21)
(y <- letters[x])

(mydf <- data.frame(edad=x, grupo=y))

str(mydf)

# Extrayendo información del df, se hace igual que con las matrices

mydf[1]
mydf[,1]
mydf$edad

# Calculando algunos estadísticos básicos

mean(mydf$edad)

# Podemos hacer uso de la función `paste` para agregar un mensaje

paste("La media de la edad es:", mean(mydf$edad))

# Podemos inspeccionar a detalle el df utilizando `summary`

summary(mydf)

# También se puede conocer su dimensión

dim(mydf)

# Podemos agregar una columna extra con datos

mydf$sexo <- c("H", "M", "H", "M", "H", "H", "M", "H","H","M", "M")
mydf

# Si fuera el caso, se puede eliminar una columna

(mydf$sexo <- NULL)

