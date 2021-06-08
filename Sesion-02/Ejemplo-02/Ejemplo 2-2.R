# 2.1 Características de los objetos (str sobre df, summary, head y view) y funciones

# Función summary

# La función summary es una función genérica usada para obtener resumenes sin embargo, también es útil para obtener resumenes de los resultados de diferentes
# ajustes a modelos

set.seed(57)
x <- rnorm(35)
e <- rnorm(35)
y <- 5 + 2*x + e
modelo <- lm(y~x)
summary(modelo)

View(iris)

# Función que calcula la moda

# En R también podemos crear nuestras propias funciones, por ejemplo

moda <- function(vector){
f.abs <- table(vector) # frecuencias absolutas
max.f.abs <- max(f.abs) # obtenemos la máxima frecuencia absoluta
pos.max <- which(f.abs == max.f.abs) # posición(es) de la(s) máxima(s) frecuencia(s) absoluta(s)
print("La(s) moda(s) es(son): ")
print(names(f.abs[pos.max]))
paste("Con una frecuencia de: ", unique(f.abs[pos.max]))
}

# Pon a prueba la función
x <- sample(1:100, 100, replace = T) # Tomamos una muestra aleatoria de tamaño 100 con reemplazo de los primeros 100 números naturales
table(x) # obtenemos las frecuencias absolutas de los valores de la muestra
moda(x) # obtenemos la moda de los valores de la muestra

