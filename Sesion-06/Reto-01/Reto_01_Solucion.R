# Reto 1. Proceso AR(1)

# 1. Simule un proceso AR(1) de la forma x[t] = 0.5 * x[t-1] + w[t] para
# t = 1, 2, ..., 200 y muestre gráficamente la serie de tiempo obtenida

# 2. Obtenga el correlograma y el correlograma parcial del proceso AR(1)
# simulado

# 3. Ajuste un modelo autorregresivo a la serie simulada utilizando la
# función ar, observe el orden del módelo y el parámetro 
# estimado (los paramétros estimados) 

# **Solución**

# Simulación en R

# Un proceso AR(1) puede ser simulado en R como sigue:

set.seed(1)
x <- w <- rnorm(200)
for(t in 2:200) x[t] <- 0.5 * x[t-1] + w[t]
plot(x, type = "l", xlab = "", ylab = "")
title(main = "Proceso AR(1) simulado",
      xlab = "Tiempo",
      ylab = expression(x[t]),
      sub = expression(x[t]==0.5*x[t-1]+w[t]))

#

acf(x, main = "")
title(main = "Correlograma del proceso AR(1) simulado", 
      sub = expression(x[t]==0.5*x[t-1]+w[t]))

#

pacf(x, main = "")
title(main = "Correlograma Parcial del proceso AR(1) simulado", 
      sub = expression(x[t]==0.5*x[t-1]+w[t]))

###

# Modelos Ajustados

# Ajuste de modelos a series simuladas

x.ar <- ar(x, method = "mle")
x.ar$order
x.ar$ar

