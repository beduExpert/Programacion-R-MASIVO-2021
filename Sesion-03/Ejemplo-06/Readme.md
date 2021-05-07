# Ejemplo 6. Series de tiempo y descomposición

#### Objetivo
- Aprender a graficar y descomponer series de tiempo

#### Requisitos
- Prework
- Gráficos: función plot

#### Desarrollo

Utilizaremos un data set del paquete `datasets`

```R
library(datasets)
(AP <- AirPassengers) # Número de pasajeros (en miles) por mes de una aerolínea
class(AP)
```

Inicio, fin y frecuencia de la serie

```R
start(AP); end(AP); frequency(AP)
```

Graficamos la serie de tiempo

```R
plot(AP, main = "Pasajeros mensuales en una aerolínea", ylab = "Número de pasajeros (en miles)", xlab = "Mes")
```

Descomposición multiplicativa

```R
comp <- decompose(AP, type = "multiplicative")
```

Graficamos la serie original, tendencia, estacionalidad, y componente aleatoria

```R
plot(comp)
```

Graficamos únicamente la serie de tendencia

```R
plot(comp$trend, col = "purple", lwd = 2, main = "Componente de tendencia", ylab = "Tendencia", xlab = "Mes")  # Gráfica de la tendencia 
```

Graficamos la componente estacional

```R
plot(comp$seasonal, col = "red", lwd = 2, main = "Componente de estacionalidad", ylab = "Estacionalidad", xlab = "Mes") # Gráfica de la estacionalidad
```

Finalmente graficamos la serie original, junto con la tendencia y tendencia*estacionalidad

```R
plot(AP, main = "Pasajeros mensuales en una aerolínea", ylab = "Número de pasajeros (en miles)", xlab = "Mes", ylim = c(100, 800))
lines(comp$trend , col = "purple", lwd = 2)
lines(comp$seasonal * comp$trend, col = "red", lty = 2, lwd = 2 )
legend(1949, 800, 
       c('Serie de tiempo original', 'Tendencia', 'Tendencia x Estacionalidad'),
       col = c('black', 'purple', 'red'), text.col = "green4", lty = c(1, 1, 2), lwd = c(1, 2, 2),
       merge = TRUE, bg = 'gray90')
```
