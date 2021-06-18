# 2.1 Características de los objetos (str sobre df, summary, head y view) y funciones

# La función `View` aplicada a un objeto de `R` como un data frame, invoca un visor de datos al estilo de una hoja de cálculo, por ejemplo:

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

