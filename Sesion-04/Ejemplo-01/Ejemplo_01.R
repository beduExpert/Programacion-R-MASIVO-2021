# Distribuciones normal y t de Student

library(ggplot2)

# Distribución normal

# En `R` para calcular valores de las funciones de densidad, distribución 
# o cuantiles de la distribución normal (continua), usamos las funciones dnorm,
# pnorm y  qnorm respectivamente. Para generar muestras aleatorias de esta
# distribución utilizamos la función rnorm.

# Consideremos una variable aleatoria (v.a.) X que se distribuye como normal
# con media 175 y desviación estándar 6 (parámetros mu = 175 y sigma = 6)

#### Función de densidad

x <- seq(-4, 4, 0.01)*6 + 175 # Algunos posibles valores que puede tomar la v.a. X (mínimo: mu-4sigma, máximo: mu+4sigma)
y <- dnorm(x, mean = 175, sd = 6) # Valores correspondientes de la función de densidad de probabilidad

plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))
abline(v = 175, lwd = 2, lty = 2) # La media es 175 

#### Función de distribución

# Para obtener P(X <= 180), es decir, la probabilidad de que X tome un valor
# menor o igual a 180, ejecutamos

pnorm(q = 180, mean = 175, sd = 6)

par(mfrow = c(2, 2))
# Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color rojo

plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

polygon(c(min(x), x[x<=180], 180), c(0, y[x<=180], 0), col="red")

# Para obtener P(X <= 165), es decir, la probabilidad de que X tome un valor
# menor o igual a 165, ejecutamos

pnorm(q = 165, mean = 175, sd = 6)

# Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color amarillo

plot(x, y, type = "l", xlab = "", ylab = "")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

polygon(c(min(x), x[x<=165], 165), c(0, y[x<=165], 0), col="yellow")

# Para obtener P(165 <= X <= 180), es decir, la probabilidad de que X tome un valor
# mayor o igual a 165 y menor o igual a 180, debemos correr

pnorm(q = 180, mean = 175, sd = 6) - pnorm(q = 165, mean = 175, sd = 6)

# Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color verde

plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

polygon(c(165, x[x>=165 & x<=180], 180), c(0, y[x>=165 & x<=180], 0), col="green")

# Para obtener P(X >= 182), es decir, la probabilidad de que X tome un valor
# mayor o igual a 182, una alternativa es 

pnorm(q = 182, mean = 175, sd = 6, lower.tail = FALSE)

# Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color azul

plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

polygon(c(182, x[x>=182], max(x)), c(0, y[x>=182], 0), col="blue")

dev.off() # Para mostrar solo una gráfica

#### Cuantiles

# Para encontrar el número b, tal que P(X <= b) = 0.75, es decir,
# el cuantil de orden 0.75, ejecutamos

(b <- qnorm(p = 0.75, mean = 175, sd = 6)) 

# Comprobamos

pnorm(b, 175, 6)

# El cuantil se encuentra en el eje de medición (eje horizontal)

plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 175, " y ", sigma == 6)))

axis(side = 1, at = b, font = 2, padj = 1, lwd = 2)

#### Muestras aleatorias

# Para generar una muestra aleatoria de tamaño n = 1000 de la v.a. X
# corremos la siguiente instrucción

set.seed(7563) # Para poder reproducir la muestra en el futuro
muestra <- rnorm(n = 1000, mean = 175, sd = 6)
length(muestra); mdf <- as.data.frame(muestra)
tail(mdf)

# Observamos que el histograma de la muestra generada tiene forma de campana
# Similar a la densidad de una normal

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

# Distribución t de Student

# En `R` para calcular valores de las funciones de densidad, distribución 
# o cuantiles de la distribución t de Student (continua), usamos las funciones dt,
# pt y  qt respectivamente. Para generar muestras aleatorias de esta
# distribución utilizamos la función rt.

# Consideremos una variable aleatoria (v.a.) T que se distribuye como t
# de Student con 7 grados de libertad (gl) (parámetro gl = 7)

#### Función de densidad

x <- seq(-4, 4, 0.01) # Algunos valores que puede tomar la v.a. T con 7 gl
y <- dt(x, df = 7) # Valores correspondientes de la densidad t de Student con 7 gl
plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
abline(v = 0, lwd=2, lty=2)

#### Función de distribución

# Para encontrar P(T <= 1.5), ejecutamos la siguiente instrucción

pt(q = 1.5, df = 7)

# Observemos el área que corresponde a esta probabilidad en la siguiente gráfica

plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
polygon(c(min(x), x[x<=1.5], 1.5), c(0, y[x<=1.5], 0), col="purple")

# Para encontrar P(T >= 2), ejecutamos

pt(q = 2, df = 7, lower.tail = FALSE)

# Observemos el área que corresponde a esta probabilidad en la siguiente gráfica

plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")

polygon(c(2, x[x>=2], max(x)), c(0, y[x>=2], 0), col="orange")

#### Cuantiles

# Para encontrar el número d tal que P(T <= d) = 0.025, es decir, 
# el cuantil de orden 0.025, corremos la siguiente instrucción

(d <- qt(p = 0.025, df = 7))

# comprobamos

pt(q = d, df = 7)

# Mostramos el cuantil contrado en el eje de medición (eje horizonta)

plot(x, y, type = "l", main = "Densidad t de Student, gl = 7", xlab="", ylab="")
axis(side = 1, at = d, font = 2, padj = 1, lwd = 2)

#### Muestras aleatorias

# Para generar una muestra aleatoria de tamaño n = 1000 de la v.a. T
# corremos la siguiente instrucción

set.seed(777) # Para poder reproducir la muestra en el futuro
muestra <- rt(n = 1000, df = 7)
length(muestra); mdf <- as.data.frame(muestra)
tail(mdf)

# Observamos que el histograma de la muestra generada tiene forma de campana
# similar a la densidad t de Student

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

