# EJEMPLO 1. Distribuciones binomial, normal y t de Student

#### Objetivo

- Aprender a obtener probabilidades, cuantiles y muestras aleatorias relacionadas con las distribuciones binomial, normal y t de Student
- Intepretar las probabilidades cuando se consideran las gráficas de las funciones de probabilidad y de densidad

#### Requisitos

- Tener R y RStudio instalado
- Haber leido el Prework

#### Desarrollo

```R
library(ggplot2) # Utilizaremos estos paquetes para algunas gráficas
library(reshape2)
```

#### Distribución binomial

En `R` para calcular valores de las funciones de probabilidad, distribución o cuantiles de la distribución binomial (discreta), usamos las funciones `dbinom`, `pbinom` y  `qbinom` respectivamente. Para generar muestras aleatorias de esta distribución utilizamos la función `rbinom`.

Consideremos un experimento binomial con n = 30 pruebas idénticas e independientes, en donde la probabilidad de éxito en cada prueba es p = 0.2 (parámetros n = 30 y p = 0.2)

1. Suponga que realiza un examen de opción múltiple con 30 preguntas, en donde
cada pregunta tiene 5 posibles respuestas, pero solo una es correcta siempre. Si
elige la respuesta al azar en cada pregunta, y estamos interesados en el número
de respuestas correctas obtenidas al final ¿Podemos decir que estamos ante un
experimento binomial?

#### Función de probabilidad

Para obtener P(X = 20), es decir, la probabilidad de observar 20 éxitos exactamente, en `R` ejecutamos

```R
dbinom(x = 20, size = 30, prob = 0.2)
```

#### Función de distribución

Para obtener P(X <= 20), es decir, la probabilidad de observar a lo más 20 éxitos, en `R` corremos

```R
pbinom(q = 20, size = 30, prob = 0.2)
```

Para encontrar el valor más pequeño b tal que P(X <= b) >= 0.35, es decir, el cuantil de orden 0.35, usamos

#### Cuantiles

```R
qbinom(p = 0.35, size = 30, prob = 0.2) # b = 5

pbinom(q = 4, size = 30, prob = 0.2) # P(X <= 4) = 0.2552 < 0.35
pbinom(q = 5, size = 30, prob = 0.2) # P(X <= 5) = 0.4275 >= 0.35
pbinom(q = 6, size = 30, prob = 0.2) # P(X <= 6) = 0.6070 >= 0.35
```

#### Muestras aleatorias

Para obtener una muestra aleatoria de tamaño n = 1000, de la distribución binomial con parámetros como especificamos, hacemos

```R
set.seed(4857) # Establecemos una semilla, para poder reproducir la muestra en el futuro
muestra <- rbinom(n = 1000, size = 30, prob = 0.2)
length(muestra); muestra[1:3]
```

Podemos observar las frecuencias absolutas de los distintos valores obtenidos

```R
as.data.frame(table(muestra))
```

También podemos observar las frecuencias relativas

```R
(df1 <- as.data.frame(table(muestra)/length(muestra)))

valg <- as.character(df1$muestra) # distintos valores generados por rbinom
(valg <- as.numeric(valg)) # Convertimos a números
```

Las frecuencias relativas son muy parecidas a las siguientes probabilidades

```R
(v1 <- round(sapply(valg, dbinom, size = 30, p = 0.2), 3))
```

Combinamos `df1` y `v1` en un único data frame

```R
(df2 <- cbind(df1, v1))
(names(df2) <- c("Exitos", "FR", "Prob"))

(df2 <- melt(df2)) # función del paquete reshape2
```

Las frecuencias relativas son muy parecidas a las probabilidades.

```R
ggplot(df2, aes(x = Exitos, y = value, fill = variable)) + 
  geom_bar (stat="identity", position = "dodge") # Funciones del paquete ggplot2
```

#### Distribución normal

En `R` para calcular valores de las funciones de densidad, distribución o cuantiles de la distribución normal (continua), usamos las funciones `dnorm`, `pnorm` y  `qnorm` respectivamente. Para generar muestras aleatorias de esta distribución utilizamos la función `rnorm`.

Consideremos una variable aleatoria (v.a.) X que se distribuye como normal con media 175 y desviación estándar 6 (parámetros mu = 175 y sigma = 6)

#### Función de densidad

```R
x <- seq(-4, 4, 0.01)*6 + 175 # Algunos posibles valores que puede tomar la v.a. X (mínimo: mu-4sigma, máximo: mu+4sigma)
y <- dnorm(x, mean = 175, sd = 6) # Valores correspondientes de la función de densidad de probabilidad

plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
abline(v = 175, lwd = 2, lty = 2) # La media es 175 
```

#### Función de distribución

Para obtener P(X <= 180), es decir, la probabilidad de que X tome un valor menor o igual a 180, ejecutamos

```R
pnorm(q = 180, mean = 175, sd = 6)

par(mfrow = c(2, 2))
```

Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color rojo

```R
plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
polygon(c(min(x), x[x<=180], 180), c(0, y[x<=180], 0), col="red")
```

Para obtener P(X <= 165), es decir, la probabilidad de que X tome un valor menor o igual a 165, ejecutamos

```R
pnorm(q = 165, mean = 175, sd = 6)
```

Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color amarillo

```R
plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
polygon(c(min(x), x[x<=165], 165), c(0, y[x<=165], 0), col="yellow")
```

Para obtener P(165 <= X <= 180), es decir, la probabilidad de que X tome un valor mayor o igual a 165 y menor o igual a 180, debemos correr

```R
pnorm(q = 180, mean = 175, sd = 6) - pnorm(q = 165, mean = 175, sd = 6)
```

Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color verde

```R
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
polygon(c(165, x[x>=165 & x<=180], 180), c(0, y[x>=165 & x<=180], 0), col="green")
```

Para obtener P(X >= 182), es decir, la probabilidad de que X tome un valor mayor o igual a 182, una alternativa es 

```R
pnorm(q = 182, mean = 175, sd = 6, lower.tail = FALSE)
```

Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color azul

```R
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
polygon(c(182, x[x>=182], max(x)), c(0, y[x>=182], 0), col="blue")

dev.off() # Para mostrar solo una gráfica
```

#### Cuantiles

Para encontrar el número b, tal que P(X <= b) = 0.75, es decir, el cuantil de orden 0.75, ejecutamos

```R
(b <- qnorm(p = 0.75, mean = 175, sd = 6)) 
```

Comprobamos

```R
pnorm(b, 175, 6)
```

El cuantil se encuentra en el eje de medición (eje horizontal)

```R
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
axis(side = 1, at = b, font = 2, padj = 1, lwd = 2)
```

#### Muestras aleatorias

Para generar una muestra aleatoria de tamaño n = 1000 de la v.a. X corremos la siguiente instrucción

```R
set.seed(7563) # Para poder reproducir la muestra en el futuro
muestra <- rnorm(n = 1000, mean = 175, sd = 6)
length(muestra); mdf <- as.data.frame(muestra)
tail(mdf)
```

Observamos que el histograma de la muestra generada tiene forma de campana similar a la densidad de una normal

```R
ggplot(mdf, aes(muestra)) + 
  geom_histogram(colour = 'red', 
                 fill = 'blue',
                 alpha = 0.3, # Intensidad del color fill
                 binwidth = 3) + 
  geom_density(aes(y = 3*..count..))+
  geom_vline(xintercept = mean(mdf$muestra), linetype="dashed", color = "black") + 
  ggtitle('Histograma para la muestra normal') + 
  labs(x = 'Valores obtenidos', y = 'Frecuencia')+
  theme_dark() +
  theme(plot.title = element_text(hjust = 0.5, size = 16))  
```

#### Regla empírica

```R
mean <- 175; sd <- 6
x <- seq(mean-4*sd, mean+4*sd, 0.01)
y <- dnorm(x, mean, sd)
plot(x, y, type = "l", xlab="valores", ylab = "", xaxt = "n", yaxt = "n")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste("Regla Empírica con ", mu == 175, " y ", sigma == 6)))
abline(v=mean, lty = 2, lwd = 2)
for(k in c(-3, -2, -1, 1, 2, 3)) abline(v = mean+k*sd, lty = 2, col = abs(k))
ps <- c(mean - 3*sd, mean - 2*sd, mean - sd, mean, mean + sd, mean + 2*sd, mean + 3*sd)
axis(side = 1, at = ps)
x0 <- NULL
for(i in 1:length(ps)-1) x0 <- c(x0, (ps[i]+ps[i+1])/2)
y0 <- dnorm(x0, mean, sd)*1/3
text(x = x0, y = y0, labels = c("2.35%", "13.5%", "34%", "34%", "13.5%", "2.35%"))
x1 <- (x[1]+ps[1])/2; y1 <- dnorm(mean, mean, sd)*1/2
xf <- (x[length(x)]+ps[length(ps)])/2; yf <- dnorm(mean, mean, sd)*1/2
text(x = c(x1, xf), y = c(y1, yf), labels = c("0.15%", "0.15%"))
segments(x0 = x1, y0 = 0, x1 = x1, y1 = y1,               # Draw one line as in Example 1
         col = "cornflowerblue",                               # Color of line
         lwd = 5,                                              # Thickness of line
         lty = "dotted")     
segments(x0 = xf, y0 = 0, x1 = xf, y1 = yf,               
         col = "cornflowerblue",                               
         lwd = 5,                                              
         lty = "dotted")     
```

#### Distribución t de Student

En `R` para calcular valores de las funciones de densidad, distribución o cuantiles de la distribución t de Student (continua), usamos las funciones `dt`, `pt` y  `qt` respectivamente. Para generar muestras aleatorias de esta distribución utilizamos la función `rt`.

Consideremos una variable aleatoria (v.a.) T que se distribuye como t de Student con 7 grados de libertad (gl) (parámetro gl = 7)

#### Función de densidad

```R
x <- seq(-4, 4, 0.01) # Algunos valores que puede tomar la v.a. T con 7 gl
y <- dt(x, df = 7) # Valores correspondientes de la densidad t de Student con 7 gl
plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
abline(v = 0, lwd=2, lty=2)
```

#### Función de distribución

Para encontrar P(T <= 1.5), ejecutamos la siguiente instrucción

```R
pt(q = 1.5, df = 7)
```

Observemos la región que corresponde a esta probabilidad en la siguiente gráfica

```R
plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
polygon(c(min(x), x[x<=1.5], 1.5), c(0, y[x<=1.5], 0), col="purple")
```

Para encontrar P(T >= 2), ejecutamos

```R
pt(q = 2, df = 7, lower.tail = FALSE)
```

Observemos la región que corresponde a esta probabilidad en la siguiente gráfica

```R
plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
polygon(c(2, x[x>=2], max(x)), c(0, y[x>=2], 0), col="orange")
```

#### Cuantiles

Para encontrar el número d tal que P(T <= d) = 0.025, es decir, el cuantil de orden 0.025, corremos la siguiente instrucción

```R
(d <- qt(p = 0.025, df = 7))
```

comprobamos

```R
pt(q = d, df = 7)
```

Mostramos el cuantil encontrado en el eje de medición (eje horizontal)

```R
plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
axis(side = 1, at = d, font = 2, padj = 1, lwd = 2)
```

#### Muestras aleatorias

Para generar una muestra aleatoria de tamaño n = 1000 de la v.a. T corremos la siguiente instrucción

```R
set.seed(777) # Para poder reproducir la muestra en el futuro
muestra <- rt(n = 1000, df = 7)
length(muestra); mdf <- as.data.frame(muestra)
tail(mdf)
```

Observamos que el histograma de la muestra generada tiene forma de campana similar a la densidad t de Student

```R
ggplot(mdf, aes(muestra)) + 
  geom_histogram(colour = 'green', 
                 fill = 'orange',
                 alpha = 0.7, # Intensidad del color fill
                 binwidth = 0.5) + 
  geom_density(aes(y = 0.5*..count..))+
  geom_vline(xintercept = mean(mdf$muestra), linetype="dashed", color = "black") + 
  ggtitle('Histograma para la muestra t de Student') + 
  labs(x = 'Valores obtenidos', y = 'Frecuencia')+
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5, size = 16))  
```
