# Ejemplo 2. Función _View_ y cómo crear una función

#### Objetivo

- Visualizar un conjuntos de datos guardados como data frames en `R` de una forma rápida
- Crear funciones para implemetar algún proceso

#### Requisitos

- Haber instalado previamente R y RStudio 
- Saber interpretar las medidas de tendencia central y de posición

#### Desarrollo

#### Función `summary`

La función `summary` es una función genérica usada para obtener resumenes de diferentes objetos de `R`, sin embarbo también es útil para obtener resumenes de los resultados de diferentes ajustes a modelos, por ejemplo:

```R
set.seed(57)
x <- rnorm(35)
e <- rnorm(35)
y <- 5 + 2*x + e
modelo <- lm(y~x)
summary(modelo)
```

#### Función `View`

La función `View` aplicada a un objeto de `R` como un data frame, invoca un visor de datos al estilo de una hoja de cálculo, por ejemplo:

```R
View(iris)
```

#### Crear funciones: Función que calcula la moda

En `R` también podemos crear nuestras propias funciones, por ejemplo:

```R
moda <- function(vector){
f.abs <- table(vector) # frecuencias absolutas
max.f.abs <- max(f.abs) # obtenemos la máxima frecuencia absoluta
pos.max <- which(f.abs == max.f.abs) # posición(es) de la(s) máxima(s) frecuencia(s) absoluta(s)
print("La(s) moda(s) es(son): ")
print(names(f.abs[pos.max]))
paste("Con una frecuencia de: ", unique(f.abs[pos.max]))
}

Pon a prueba la función 

x <- sample(1:100, 100, replace = T) # Tomamos una muestra aleatoria de tamaño 100 con reemplazo de los primeros 100 números naturales
table(x) # obtenemos las frecuencias absolutas de los valores de la muestra
moda(x) # obtenemos la moda de los valores de la muestra
```

