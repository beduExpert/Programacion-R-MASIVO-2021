# EJEMPLO 1. Medidas de tendencia central, de posición y de dispersión

#### Objetivo

- Aprender a calcular medidas de tendencia central, de posición y de dispersión para conjuntos de datos, con ayuda de funciones de `R`.
- Interpretar los resultados obtenidos

#### Requisitos

- Tener previamente instalados R y RStudio
- Haber leido y comprendido el Prework

#### Desarrollo

#### Medidas de tendencia central

En `R` utilizamos la función `mean` para calcular la media de un conjunto de mediciones, por ejemplo

```R
x = c(4000, 9000, 9000, 10000); mean(x)
```

Para calcular la mediana, utilizamos la función `median` de la siguiente manera

```R
median(x)
```

Si lo que deseamos es obtener la moda de un conjunto de mediciones, una alternativa es instalar el paquete `DescTools` en `R` mediante la instrucción `install.packages("DescTools")`, luego utilizamos la función `Mode` del paquete
`DescTools`

```R
library(DescTools)
Mode(x) # Mode es diferente de mode (R es case sensitive)
```

#### Medidas de posición

En `R` utilizamos la función `quantile` para obtener cuantiles muestrales. Por ejemplo

```R
x <- c(29, 13, 62, 4, 63, 96, 1, 90, 50, 46)

quantile(x, 0.25) # cuantil del 25%
quantile(x, c(0.25,0.50,0.75)) # Cuartiles
quantile(x, seq(0.1,0.9, by = 0.1)) # Deciles

```
#### Medidas de dispersión

Podemos calcular el rango intercuartílico en `R` con la función `IQR`, por ejemplo

```R
IQR(x)
```

o bien

```R
quantile(x, probs = 0.75) - quantile(x, probs = 0.25) # Tercer cuartil menos primer cuartil
```

La varianza y desviación estándar muestral en `R` las calculamos con las  siguientes instrucciones respectivamente

```R
var(x)
sd(x)
```
