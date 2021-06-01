# Reto 1. Regresión Lineal Múltiple

# Supongamos que nuestro trabajo consiste en aconsejar a un cliente sobre 
# como mejorar las ventas de un producto particular, y el conjunto de datos 
# con el que disponemos son datos de publicidad que consisten en las ventas 
# de aquel producto en 200 diferentes mercados, junto con presupuestos de 
# publicidad para el producto en cada uno de aquellos mercados para tres 
# medios de comunicación diferentes: TV, radio, y periódico. No es posible 
# para nuestro cliente incrementar directamente las ventas del producto. Por 
# otro lado, ellos pueden controlar el gasto en publicidad para cada uno de 
# los tres medios de comunicación. Por lo tanto, si determinamos que hay una 
# asociación entre publicidad y ventas, entonces podemos instruir a nuestro 
# cliente para que ajuste los presupuestos de publicidad, y así 
# indirectamente incrementar las ventas. En otras palabras, nuestro objetivo 
# es desarrollar un modelo preciso que pueda ser usado para predecir las 
# ventas sobre la base de los tres presupuestos de medios de comunicación.

# 1. Ajuste modelos de regresión lineal múltiple a los datos 
# advertisement.csv y elija el modelo "más adecuado" siguiendo los 
# procedimientos vistos en el Ejemplo 1.

# **Solución**

#  Y: Sales (Ventas de un producto)
# X1: TV (Presupuesto de publicidad en TV para el producto)
# X2: Radio (Presupuesto de publicidad en Radio para el producto)
# X3: Newspaper (Presupuesto de publicidad en Periódico para el producto)

# Primero debemos establecer nuestro directorio de trabajo y el archivo
# de datos (advertising.csv) que importaremos a R deberá de estar en este directorio

setwd("C:\\Users\\User\\Desktop\\Programacion-con-R-Santander-master\\Sesion-05\\Reto-01")
adv <- read.csv("advertising.csv")

# Observamos algunas filas y la dimensión del data frame

tail(adv, 2) 
dim(adv)
attach(adv)

# Acontinuación mostramos una matriz de gráficos de dispersión de los
# tres predictores continuos y la variable de respuesta. 

pairs(~ Sales + TV + Radio + Newspaper, data = adv, gap = 0.4, cex.labels = 1.5)

# Observamos relaciones aproximadamente lineales

# Llevamos a cabo el ajuste de un modelo
# Sales = beta0 + beta1*TV + beta2*Radio + beta3*Newspaper + e

m1 <- lm(Sales ~ TV + Radio + Newspaper)

# Obtenemos un resumen

summary(m1)

# Ajustamos nuevamente un modelo pero ahora sin considerar la variable Newspaper
# ya que en el resultado anterior se observó que su coeficiente de regresión
# no fue estadísticamente significativo (al considerar su p-value)

# Y = beta0 + beta1*TV + beta2*Radio + e (Reducido)

m2 <- lm(Sales ~ TV + Radio)

# Obtenemos un resumen del modelo ajustado

summary(m2)

# Una forma alternativa de obtener m2 es usar el comando update

m2 <- update(m1, ~.-Newspaper)
summary(m2)

# Diagnósticos

plot(m2$fitted.values, Sales, xlab = "Valores ajustados", ylab = "Sales")
abline(lsfit(m2$fitted.values, Sales))

# Acontinuación mostramos una matriz de gráficos de dispersión de los
# dos predictores continuos. 

pairs(~ TV + Radio, data = adv, gap = 0.4, cex.labels = 1.5)


# Acontinuación veremos gráficas de residuales estandarizados contra cada
# predictor. 

StanRes2 <- rstandard(m2)
par(mfrow = c(2, 2))
plot(TV, StanRes2, ylab = "Residuales Estandarizados")
plot(Radio, StanRes2, ylab = "Residuales Estandarizados")

# Buscamos evidencia para soportar la hipótesis de normalidad en los errores 

qqnorm(StanRes2)
qqline(StanRes2)

dev.off()

shapiro.test(StanRes2)

######

# Análisis de covarianza

# Consideraremos el siguiente modelo 

# Sales = beta0 + beta1*TV + beta2*Radio +  beta3*TV*Radio + e

mfull <- lm(Sales ~ TV + Radio + 
                         TV:Radio)

summary(mfull)

# Ahora compararemos el modelo mfull contra el modelo m2. 
# Es decir, llevaremos a cabo una prueba de hipótesis
# general de

# H0: beta3 = 0
# es decir Sales = beta0 + beta1*TV + beta2*Radio + e
# contra
# H1: H0 no es verdad
# es decir, 
# Sales = beta0 + beta1*TV + beta2*Radio +  beta3*TV*Radio +  e

# Esta puede lograrse usando la siguiente prueba-F parcial.

anova(m2,mfull)

# Dado que el p-value es aproximadamente 7.633e-07, rechazamos la hipótesis nula
# y nos decidimos por la hipótesis alternativa
# Sales = beta0 + beta1*TV + beta2*Radio +  beta3*TV*Radio +  e

######

# Diagnósticos

# En regresión múltiple, las gráficas de residuales o de residuales
# estandarizados proporcionan información directa sobre la forma
# en la cual el modelo está mal especificado cuando se cumplen
# las siguientes dos condiciones:

# E(Y | X = x) = g(beta0 + beta1*x1 + ... + betap*xp) y
# E(Xi | Xj) aprox alpha0 + alpha1*Xj

# Cuando estas condiciones se cumplen, la gráfica de Y contra
# los valores ajustados, proporciona información directa acerca de g.
# En regresión lineal múltiple g es la función identidad. En
# este caso la gráfica de Y contra los valores ajustados
# debe producir puntos dispersos alrededor de una recta.
# Si las condiciones no se cumplen, entonces un patrón en la
# gráfica de los residuales indica que un modelo incorrecto
# ha sido ajustado, pero el patrón mismo no proporciona 
# información directa sobre como el modelo está mal específicado.

# Ahora tratemos de verificar si el modelo ajustado es un modelo válido.

# Mostramos una gráfica de Y, las ventas contra los valores
# ajustados 

plot(mfull$fitted.values, Sales, xlab = "Valores ajustados", ylab = "Sales")
abline(lsfit(mfull$fitted.values, Sales))

# Acontinuación mostramos una matriz de gráficos de dispersión de los
# dos predictores continuos. 

pairs(~ TV + Radio, data = adv, gap = 0.4, cex.labels = 1.5)


# Acontinuación veremos gráficas de residuales estandarizados contra cada
# predictor. La naturaleza aleatoria de estas gráficas es un indicativo de
# que el modelo ajustado es un modelo válido para los datos.

StanRes <- rstandard(mfull)
par(mfrow = c(2, 2))
plot(TV, StanRes, ylab = "Residuales Estandarizados")
plot(Radio, StanRes, ylab = "Residuales Estandarizados")

# Buscamos evidencia para soportar la hipótesis de normalidad en los errores 

qqnorm(StanRes)
qqline(StanRes)

dev.off()

shapiro.test(StanRes)

# Inspirado en:

# [S.J. Sheather, A Modern Approach to Regression with R, DOI: 10.1007/978-0-387-09608-7_2, © Springer Science + Business Media LLC 2009](https://gattonweb.uky.edu/sheather/book/index.php)

