# EJEMPLO 3. Contraste de hipótesis

# Contrastes comunes con muestras grandes

# Contraste de dos colas
# Dada dos muestras aleatorias de tamaños n1 = 56 y n2 = 63

set.seed(174376)
m1 <- rexp(n = 56, rate = 4.1); 1/4.1 # media real de la población
tail(as.data.frame(m1))
m2 <- rexp(n = 63, rate = 3.4); 1/3.4 # media real de la población
tail(as.data.frame(m2))
1/4.1-1/3.4 # diferencia de medias real
# estamos interesados en contrastar las hipótesis H0: mu1-mu2 = 0 vs H1: mu1-mu2 diferente de 0 (contraste de dos colas)

# El valor observado del estadístico de prueba en este caso está dado por

z0 <- (mean(m1)-mean(m2)-0)/sqrt(var(m1)/56 + var(m2)/63)
z0
# que proviene de una distribución normal estándar aproximadamente.

# Supongamos que estamos interesados en encontrar la región de rechazo (de dos colas) con un nivel de significancia alpha = 0.05, debemos encontrar el valor z_{0.025} que satisface P(Z > z_{0.025}) = 0.025.

(z.025 <- qnorm(p = 0.025, lower.tail = FALSE))
# Como

(z0 < -z.025) | (z0 > z.025)
# fallamos en rechazar la hipótesis nula.

# p-value El p-value lo podemos calcular como

(pvalue <- 2*pnorm(z0, lower.tail = FALSE))
x <- seq(-4, 4, 0.01)
y <- dnorm(x)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad normal estándar", sub = expression(paste(mu == 0, " y ", sigma == 1)))

polygon(c(min(x), x[x<=-z0], -z0), c(0, y[x<=-z0], 0), col="purple")
axis(side = 1, at = -z0, font = 2, padj = 1, lwd = 2)

polygon(c(z0, x[x>=z0], max(x)), c(0, y[x>=z0], 0), col="purple")
axis(side = 1, at = z0, font = 2, padj = 1, lwd = 2)

# Contraste de hipótesis con muestras pequeñas para mu y mu1 - mu2

# Contraste de dos colas
# Dada dos muestras aleatorias de tamaños n1 = 23 y n2 = 20

set.seed(1776)
m1 <- rnorm(n = 23, mean = 175, sd = 3)
tail(as.data.frame(m1))
m2 <- rnorm(n = 20, mean = 160, sd = 3)
tail(as.data.frame(m2))
175-160 # diferencia de medias real
# estamos interesados en contrastar las hipótesis H0: mu1-mu2 = 0 vs H1: mu1-mu2 diferente de 0 (contraste de dos colas)

# El valor observado del estadístico de prueba en este caso está dado por

t0 <- (mean(m1)-mean(m2)-0)/(sqrt((22*var(m1)+19*var(m2))/(23+20-2))*sqrt(1/23+1/20))
t0
# que proviene de una distribución t de Student con 23 + 20 - 2 = 41 gl

# Supongamos que estamos interesados en encontrar la región de rechazo (de dos colas) con un nivel de significancia alpha = 0.05, debemos encontrar el valor t_{0.025} que satisface P(T > t_{0.025}) = 0.025.

(t.025 <- qt(p = 0.025, df= 41, lower.tail = FALSE))
# Como

(t0 < -t.025) | (t0 > t.025)
# rechazamos la hipótesis nula.

# p-value El p-value lo podemos calcular como

(pvalue <- 2*pt(t0, df = 41, lower.tail = FALSE))

### También podemos usar la función t.test para llevar a cabo el procedimiento 
# de contraste de hipótesis

t.test(x = m1, y = m2,
       alternative = "two.sided",
       mu = 0, paired = FALSE, var.equal = TRUE)

