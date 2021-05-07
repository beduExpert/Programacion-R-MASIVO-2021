# Solución del Reto 1.

# Considere el siguiente vector

set.seed(134)

x <- round(rnorm(1000, 175, 6), 1)

# 1. Calcule, la media, mediana y moda de los valores en x
# 2. Obtenga los deciles de los números en x
# 3. Encuentre el rango intercuartílico, la desviación estándar y varianza muestral

# Solución

library(DescTools)

mean(x); median(x); Mode(x)
quantile(x, probs = seq(0.1, 0.9, 0.1))
IQR(x); sd(x); var(x)
