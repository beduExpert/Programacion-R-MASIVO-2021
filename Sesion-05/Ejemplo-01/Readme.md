# Ejemplo 1. Regresión Lineal Simple

#### Objetivo

- Predecir una variable numérica a partir de otra variable predictora, cuando exista una relación aproximadamente lineal entre las variables y sea razonable asumir algunos supuestos.

#### Requisitos

- Tener instalado R y RStudio
- Haber estudiado el Prework

#### Desarrollo

Primero hay que establecer el directorio de trabajo y este deberá contener el archivo de datos **production.txt**

Leemos nuestros datos con la función `read.table`

```R
production <- read.table("production.txt", header = TRUE)
```

Los datos que importamos a `R` se encuentran como data frame con nombre `production`. Aplicamos la función `attach` al data frame `production` para poder manipular las columnas mediante sus nombres.

```R
attach(production)
```

Hacemos el gráfico de dispersión

```R
plot(RunSize, RunTime, xlab = "Tamaño de ejecución", 
     ylab = "Tiempo de ejecución", pch = 16)
```

Ajustamos un modelo de regresión lineal simple con la función `lm`, en donde la variable de respuesta es `RunTime` y la variable predictora es `RunSize`. Guardamos nuestro modelo ajustado con el nombre de `m1`.

```R
m1 <- lm(RunTime~RunSize)
```

Obtenemos un resumen de nuestro modelo ajustado mediante la función `summary`

```R
summary(m1)
```

Graficamos nuestros datos nuevamente, ahora con la recta de regresión estimada, mostrando algunas ecuaciones y algunos residuales gráficamente.

```R
plot(RunSize, RunTime, xlab = "Tamaño de ejecución", 
     ylab = "Tiempo de ejecución", pch = 16)
abline(lsfit(RunSize, RunTime)) # Trazamos la recta de regresión estimada
mtext(expression(paste('Modelo de regresión lineal simple:',
                       ' ',
                       y[i] == beta[0] + beta[1]*x[i] + e[i])),
      side = 3, adj=1, font = 2)
      
# Recta de regresión poblacional

text(x = 200, y = 240, expression(paste('Recta de regresión:',
                                        ' ',
                                        y[i] == beta[0] + beta[1]*x[i])),
     adj = 1, font = 2)


# Recta de regresión estimada

text(x = 350, y = 180, expression(paste('Recta estimada:',
                                        ' ',
                                        hat(y)[i] == hat(beta)[0] + hat(beta)[1]*x[i])),
     adj = 1, font = 2)

# Recta de regresión estimada

text(x = 350, y = 160, expression(paste('Recta estimada:',
                                        ' ',
                                        hat(y)[i] == 149.74770 + 0.25924*x[i])),
     adj = 1, font = 2)

# Residuales

points(189, 215, pch=16, col = "red") # Punto muestral
149.74770 + 0.25924 * 189 # Valor y sobre la recta estimada
lines(c(189, 189), c(198.7441, 215), col = "red")

points(173, 166, pch=16, col = "red") # Punto muestral
149.74770 + 0.25924 * 173 # Valor y sobre la recta estimada
lines(c(173, 173), c(166, 194.5962), col = "red")
```

Acontinuación encontramos el cuantil de orden 0.975 de la distribución t de Student con 18 (n - 2) grados de libertad. En total tenemos n = 20 observaciones en nuestro conjunto de datos. Estamos encontrando el valor que satisface P(T > tval) = 0.025

```R
tval <- qt(1-0.05/2, 18)
tval
```

Comprobamos

```R
pt(tval, df = 18)
```

Encontramos intervalos de confianza del 95% para el intercepto y la pendiente del modelo de regresión lineal simple

```R
round(confint(m1, level = 0.95), 3)
```

Ahora encontramos intervalos de confianza del 95% para la recta de regresión poblacional en algunos valores de X (RunSize)

```R
RunSize0 <- c(50,100,150,200,250,300,350) # Algunos posibles valores de RunSize

(conf <- predict(m1, newdata = 
                   data.frame(RunSize = RunSize0), 
                 interval = "confidence", level = 0.95))

# Podemos visualizar gráficamente estos intervalos de confianza

lines(RunSize0, conf[, 2], lty = 2, lwd = 2, col = "green") # límites inferiores
lines(RunSize0, conf[, 3], lty = 2, lwd = 2, col = "green") # límites superiores
```

También podemos encontrar intervalos de predicción del 95% para el valor real de la variable de respuesta Y (RunTime) en algunos valores de X (RunSize)

```R
(pred <- predict(m1, newdata = 
          data.frame(RunSize = RunSize0), 
        interval = "prediction", level = 0.95))

# Podemos visualizar gráficamente estos intervalos de predicción

lines(RunSize0, pred[, 2], lty = 2, lwd = 2, col = "blue") # límites inferiores
lines(RunSize0, pred[, 3], lty = 2, lwd = 2, col = "blue") # límites superiores
```

Note como los intervalos de confianza están contenidos dentro de los intervalos de predicción correspondientes.

También es posible llevar a cabo un análisis de varianza para decidir si existe asociación lineal entre RunSize y RunTime

```R
anova(m1)
```

#### Gráficos de diagnóstico de R

Cuando usamos un modelo de regresión, hacemos una serie de suposiciones. Entonces debemos hacer diagnósticos de regresión para verificar las supocisiones.

```R
par(mfrow = c(2, 2))
plot(m1)
dev.off()
```

Inspirado en:

[S.J. Sheather, A Modern Approach to Regression with R, DOI: 10.1007/978-0-387-09608-7_2, © Springer Science + Business Media LLC 2009](https://gattonweb.uky.edu/sheather/book/index.php)
