# Reto 1. Distribución normal

# Una compañía que manufactura y embotella jugo de manzana usa una máquina que 
# automáticamente llena botellas de 16 onzas. Hay alguna variación, no obstante, 
# en las cantidades de líquido que se ponen en las botellas que se llenan. 
# Se ha observado que la cantidad de líquido está normalmente distribuida en 
# forma aproximada con media de 16 onzas y desviación estándar de 1 onza.

# Determine la proporción de botellas que tendrán más de 18 onzas.

# **Solución**
  
pnorm(q = 18, mean = 16, sd = 1, lower.tail = FALSE)

# Observemos la región que corresponde a esta probabilidad en la siguiente gráfica en color azul

x <- seq(-4, 4, 0.01) + 16 # Algunos posibles valores que puede tomar la v.a. X (mínimo: mu-4sigma, máximo: mu+4sigma)
y <- dnorm(x, mean = 16, sd = 1) # Valores correspondientes de la función de densidad de probabilidad

plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad de Probabilidad Normal", sub = expression(paste(mu == 16, " y ", sigma == 1)))
polygon(c(18, x[x>=18], max(x)), c(0, y[x>=18], 0), col="blue")
