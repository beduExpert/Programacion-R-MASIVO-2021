# Ejemplo 2. Modelos estocásticos básicos y modelos estacionarios

# Ruido Blanco y simulación en R

set.seed(1)
w <- rnorm(100)
plot(w, type = "l", xlab = "")
title(main = "Ruido Blanco Gaussiano", xlab = "Tiempo")

###

# Para ilustrar mediante simulación como las muestras pueden diferir 
# de sus poblaciones subyacentes considere lo siguiente

x <- seq(-3, 3, length = 1000)
hist(w, prob = T, ylab = "", xlab = "", main = "") 
points(x, dnorm(x), type = "l")
title(ylab = "Densidad", xlab = "Valores simulados de la distribución normal estandar",
      main = "Comparación de una muestra con su población subyacente")

###

acf(w, main = "")
title(main = "Función de Autocorrelación Muestral", 
      sub = "Valores simulados de la distribución normal estandar")

###

              # Caminata Aleatoria
              # Simulación en R

set.seed(2)
x <- w <- rnorm(1000)
for(t in 2:1000) x[t] <- x[t-1] + w[t]

plot(x, type = "l", main = "Caminata Aleatoria Simulada", 
     xlab = "t", ylab = expression(x[t]), 
     sub = expression(x[t]==x[t-1]+w[t]))

acf(x, main = "")
title(main = "Correlograma para la caminata aleatoria simulada", 
      sub = expression(x[t]==x[t-1]+w[t]))

# El correlograma de las series de diferencias puede usarse para evaluar si una serie dada
# puede modelarse como una caminata aleatoria

acf(diff(x), main = "")
title(main = "Correlograma de la serie de diferencias", 
      sub = expression(nabla*x[t]==x[t]-x[t-1]))

#### Modelos AR(p), MA(q) y ARMA(p, q)

# Modelos AR(p)

# Correlograma de un proceso AR(1)

rho <- function(k, alpha) alpha^k

plot(0:10, rho(0:10, 0.7), type = "h", ylab = "", xlab = "")
title(main = "Correlograma para un proceso AR(1)",
      ylab = expression(rho[k] == alpha^k),
      xlab = "lag k",
      sub = expression(x[t]==0.7*x[t-1]+w[t]))

plot(0:10, rho(0:10, -0.7), type = "h", ylab = "", xlab = "")
title(main = "Correlograma para un proceso AR(1)",
      ylab = expression(rho[k] == alpha^k),
      xlab = "lag k",
      sub = expression(x[t]==-0.7*x[t-1]+w[t]))
abline(h = 0)

###

# Simulación en R

# Un proceso AR(1) puede ser simulado en R como sigue:

set.seed(1)
x <- w <- rnorm(100)
for(t in 2:100) x[t] <- 0.7 * x[t-1] + w[t]

plot(x, type = "l", xlab = "", ylab = "")
title(main = "Proceso AR(1) simulado",
      xlab = "Tiempo",
      ylab = expression(x[t]),
      sub = expression(x[t]==0.7*x[t-1]+w[t]))

#

acf(x, main = "")
title(main = "Correlograma del proceso AR(1) simulado", 
      sub = expression(x[t]==0.7*x[t-1]+w[t]))

#

pacf(x, main = "")
title(main = "Correlograma Parcial del proceso AR(1) simulado", 
      sub = expression(x[t]==0.7*x[t-1]+w[t]))

###

# Modelos Ajustados

# Ajuste de modelos a series simuladas

x.ar <- ar(x, method = "mle")
x.ar$order
x.ar$ar
x.ar$ar + c(-2, 2)*sqrt(x.ar$asy.var)

# Serie de temperaturas globales, expresadas como anomalías de las medias mensuales: Ajuste de un modelo AR

Global <- scan("global.txt")
Global.ts <- ts(Global, st = c(1856, 1), end = c(2005, 12), fr = 12)
Global.annual <- aggregate(Global.ts, FUN = mean)

plot(Global.ts, xlab = "Tiempo", ylab = "Temperatura en °C", 
     main = "Serie de Temperatura Global",
     sub = "Serie mensual: Enero de 1856 a Diciembre de 2005")

plot(Global.annual, xlab = "Tiempo", ylab = "Temperatura en °C", 
     main = "Serie de Temperatura Global",
     sub = "Serie anual de temperaturas medias: 1856 a 2005")

#

mean(Global.annual)
Global.ar <- ar(Global.annual, method = "mle")
Global.ar$order
Global.ar$ar

acf(Global.ar$res[-(1:Global.ar$order)], lag = 50, main = "")
title(main = "Correlograma de la serie de residuales",
      sub = "Modelo AR(4) ajustado a la serie de temperaturas globales anuales")

####################################################################################################################################################

# Modelos MA(q)

# Ejemplos en R: Correlograma y Simulación

# Función en R para calcular la Función de Autocorrelación

rho <- function(k, beta){
  q <- length(beta) - 1
  if(k > q) ACF <- 0 else {
    s1 <- 0; s2 <- 0
    for(i in 1:(q-k+1)) s1 <- s1 + beta[i]*beta[i + k]
    for(i in 1:(q+1)) s2 <- s2 + beta[i]^2
    ACF <- s1/s2}
  ACF}

# Correlograma para un proceso MA(3)

beta <- c(1, 0.7, 0.5, 0.2)
rho.k <- rep(1, 10)
for(k in 1:10) rho.k[k] <- rho(k, beta)

plot(0:10, c(1, rho.k), ylab = expression(rho[k]), xlab = "lag k", type = "h",
     sub = expression(x[t] == w[t] + 0.7*w[t-1] + 0.5*w[t-2] + 0.2*w[t-3]),
     main = "Función de autocorrelación para un proceso MA(3)")
abline(0, 0)

# Correlograma para otro proceso MA(3)

beta <- c(1, -0.7, 0.5, -0.2)
rho.k <- rep(1, 10)
for(k in 1:10) rho.k[k] <- rho(k, beta)

plot(0:10, c(1, rho.k), ylab = expression(rho[k]), xlab = "lag k", type = "h",
     sub = expression(x[t] == w[t] - 0.7*w[t-1] + 0.5*w[t-2] - 0.2*w[t-3]),
     main = "Función de autocorrelación para un proceso MA(3)")
abline(0, 0)

####################################################################################################################################################

# Simulación de un proceso MA(3)

set.seed(1)
b <- c(0.8, 0.6, 0.4)
x <- w <- rnorm(1000)
for(t in 4:1000){
  for(j in 1:3) x[t] <- x[t] + b[j]*w[t-j]
}

plot(x, type = "l", ylab = expression(x[t]), xlab = "Tiempo t",
     sub = expression(x[t] == w[t] + 0.8*w[t-1] + 0.6*w[t-2] + 0.4*w[t-3]),
     main = "Serie de tiempo simulada de un proceso MA(3)")

###

acf(x, main = "")
title(main = "Correlograma para un proceso MA(3) simulado", 
      sub = expression(x[t] == w[t] + 0.8*w[t-1] + 0.6*w[t-2] + 0.4*w[t-3]))

####################################################################################################################################################

# Ajuste de modelos MA 

x.ma <- arima(x, order = c(0, 0, 3))
x.ma

####################################################################################################################################################

# Modelos ARMA(p, q)


# Simulación y Ajuste

set.seed(1)
x <- arima.sim(n = 10000, list(ar = -0.6, ma = 0.5))

plot(x[1:100], type = "l", xlab = "")
title(main = "Serie simulada", xlab = "Tiempo", 
      sub = expression(x[t] == -0.6*x[t-1] + w[t] + 0.5*w[t-1]))

#

coef(arima(x, order = c(1, 0, 1)))

# Inspirado en:
  
# P. Cowpertwait & A. Metcalfe. (2009). Introductory Time Series with R. 233 Spring Street, New York, NY 10013, USA: Springer Science+Business Media, LLC.

# Otra referencia:
  
# J. Cryer & K. Chan. (2008). Time Series Analysis With Applications in R. 233 Spring Street, New York, NY 10013, USA: Springer Science+Business Media, LLC.

