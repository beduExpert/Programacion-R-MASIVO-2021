# EJEMPLO 1. Distribuciones normal y t de Student

#### Objetivo

- Aprender a obtener probabilidades, cuantiles y muestras aleatorias relacionadas con las distribuciones normal y t de Student
- Intepretar las probabilidades cuando se consideran las gráficas de las funciones de densidad

#### Requisitos

- Tener `R` y RStudio instalado
- Haber leído el Prework

#### Desarrollo

```R
library(ggplot2) # Utilizaremos este paquete para algunas gráficas
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

![NormalDensity](https://user-images.githubusercontent.com/50311949/118017644-7a76e300-b31c-11eb-9f88-55a39e891950.png)

#### Función de distribución

Para obtener P(X <= 180), es decir, la probabilidad de que X tome un valor menor o igual a 180, ejecutamos

```R
pnorm(q = 180, mean = 175, sd = 6)

par(mfrow = c(2, 2))
```

Observemos el área que corresponde a esta probabilidad en la siguiente gráfica en color rojo

```R
plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
polygon(c(min(x), x[x<=180], 180), c(0, y[x<=180], 0), col="red")
```

Para obtener P(X <= 165), es decir, la probabilidad de que X tome un valor menor o igual a 165, ejecutamos

```R
pnorm(q = 165, mean = 175, sd = 6)
```

Observemos el área que corresponde a esta probabilidad en la siguiente gráfica en color amarillo

```R
plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
polygon(c(min(x), x[x<=165], 165), c(0, y[x<=165], 0), col="yellow")
```

Para obtener P(165 <= X <= 180), es decir, la probabilidad de que X tome un valor mayor o igual a 165 y menor o igual a 180, debemos correr

```R
pnorm(q = 180, mean = 175, sd = 6) - pnorm(q = 165, mean = 175, sd = 6)
```

Observemos el área que corresponde a esta probabilidad en la siguiente gráfica en color verde

```R
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
polygon(c(165, x[x>=165 & x<=180], 180), c(0, y[x>=165 & x<=180], 0), col="green")
```

Para obtener P(X >= 182), es decir, la probabilidad de que X tome un valor mayor o igual a 182, una alternativa es 

```R
pnorm(q = 182, mean = 175, sd = 6, lower.tail = FALSE)
```

Observemos el área que corresponde a esta probabilidad en la siguiente gráfica en color azul

```R
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
polygon(c(182, x[x>=182], max(x)), c(0, y[x>=182], 0), col="blue")

dev.off() # Para mostrar solo una gráfica
```

![Normales](https://user-images.githubusercontent.com/50311949/118018176-14d72680-b31d-11eb-9eed-6057e2f2c9ba.png)

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

![CuantilNormal](https://user-images.githubusercontent.com/50311949/118018464-70091900-b31d-11eb-8fc8-196b32d89a03.png)

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

![HistogramaNormal](https://user-images.githubusercontent.com/50311949/118018751-cf672900-b31d-11eb-80e0-2049a5374bd0.png)

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

![DensidadStudent](https://user-images.githubusercontent.com/50311949/118019322-78ae1f00-b31e-11eb-8dc3-08d29ce188e2.png)

#### Función de distribución

Para encontrar P(T <= 1.5), ejecutamos la siguiente instrucción

```R
pt(q = 1.5, df = 7)
```

Observemos el área que corresponde a esta probabilidad en la siguiente gráfica

```R
plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
polygon(c(min(x), x[x<=1.5], 1.5), c(0, y[x<=1.5], 0), col="purple")
```

![Student1](https://user-images.githubusercontent.com/50311949/118019564-bdd25100-b31e-11eb-8534-93c7c704a2d8.png)

Para encontrar P(T >= 2), ejecutamos

```R
pt(q = 2, df = 7, lower.tail = FALSE)
```

Observemos el área que corresponde a esta probabilidad en la siguiente gráfica

```R
plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
polygon(c(2, x[x>=2], max(x)), c(0, y[x>=2], 0), col="orange")
```

![Student2](https://user-images.githubusercontent.com/50311949/118019752-f5d99400-b31e-11eb-8a59-d33dbe1325fd.png)

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

![Student3](https://user-images.githubusercontent.com/50311949/118020024-46e98800-b31f-11eb-8e94-b44d8bd027e3.png)

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

![HistogramaStudent](https://user-images.githubusercontent.com/50311949/118020192-6d0f2800-b31f-11eb-9c38-3db6201909f4.png)
