# Reto 2.

# Considere el data frame `mtcars` de `R` y utilice las funciones `str`, 
# `summary`, `head` y `View` para observar las características del objeto
# y tener una mayor comprensión de este.

# Crea una función que calcule la mediana de un conjuntos de valores, sin utilizar la función median

# Solución

# 1. 

str(mtcars)
summary(mtcars)
head(mtcars)
View(mtcars)

# 2. 

mediana <- function(vector){
n <- length(vector) # Número de elementos del vector
vector <- sort(vector) # Ordenamos los valores de menor a mayor
if(n%%2 == 0){ # Si el número de elementos es par hacemos lo siguiente
paste("La mediana es: ", mean(vector[c(n/2, n/2+1)])) 
} else{ # De otra manera hacemos lo siguiente
paste("La mediana es: ", vector[round(n/2)])
}

}

mediana(1:10)
mediana(1:11)
