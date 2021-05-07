# EJEMPLO 4. Contraste de hipótesis

#### Objetivo

- Llevar a cabo contrastes de hipótesis que ayuden a tomar decisiones

#### Requisitos

- Tener instalado `R` y RStudio
- Haber estudiado el Prework

#### Desarrollo

#### *Nota: con cubrir un tipo de contraste es suficiente, ya que las ideas son similares en los diferentes tipos de contrastes de hipótesis*

#### Contrastes comunes con muestras grandes

#### Contraste de cola superior

Dada una muestra aleatoria de tamaño n = 40

```R
set.seed(104)
muestra <- rexp(n = 40, rate = 6) # media = 1/6 aprox 0.1667 (media de la población)
tail(as.data.frame(muestra))
```

estamos interesados en contrastar las hipótesis H0: mu = 0.1 *vs* H1: mu > 0.1 (contraste de cola superior)

El valor observado del estadístico de prueba en este caso está dado por

```R
z0 <- (mean(muestra)-0.1)/(sd(muestra)/sqrt(40)) 
z0
```

que proviene de una distribución normal estándar aproximadamente.

Supongamos que estamos interesados en encontrar la región de rechazo (de cola superior) con un nivel de significancia alpha = 0.05, debemos encontrar el valor z_{0.05} que satisface P(Z > z_{0.05}) = 0.05.

```R
(z.05 <- qnorm(p = 0.05, lower.tail = FALSE))
```

Como

```R
z0 > z.05
```

rechazamos la hipótesis nula

**p-value** El p-value lo podemos calcular como 

```R
(pvalue <- pnorm(z0, lower.tail = FALSE))
```

```R
x <- seq(-4, 4, 0.01)
y <- dnorm(x)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad normal estándar", sub = expression(paste(mu == 0, " y ", sigma == 1)))

polygon(c(z0, x[x>=z0], max(x)), c(0, y[x>=z0], 0), col="red")
axis(side = 1, at = z0, font = 2, padj = 1, lwd = 2)
```

#### Contraste de cola inferior

Dada una muestra aleatoria de tamaño n = 45

```R
set.seed(174)
muestra <- sample(x = c(1, 0), size = 45, replace = TRUE, prob = c(0.67, 0.33)); 0.67 # media real de la población
tail(as.data.frame(muestra))
```

estamos interesados en contrastar las hipótesis H0: p = 0.9 *vs* H1: p < 0.9 (contraste de cola inferior)

El valor observado del estadístico de prueba en este caso está dado por

```R
z0 <- (mean(muestra)-0.9)/sqrt((0.9*(1-0.9))/45)
z0
```

que proviene de una distribución normal estándar aproximadamente.

Supongamos que estamos interesados en encontrar la región de rechazo (de cola inferior) con un nivel de significancia alpha = 0.05, debemos encontrar el valor z_{0.05} que satisface P(Z < z_{0.05}) = 0.05.

```R
(z.05 <- qnorm(p = 0.05))
```

Como

```R
z0 < z.05
```

rechazamos la hipótesis nula.

**p-value** El p-value lo podemos calcular como 

```R
(pvalue <- pnorm(z0)) # p-value muy pequeño
```

#### Contraste de dos colas

Dada dos muestras aleatorias de tamaños n1 = 56 y n2 = 63

```R
set.seed(174376)
m1 <- rexp(n = 56, rate = 4.1); 1/4.1 # media real de la población
tail(as.data.frame(m1))
m2 <- rexp(n = 63, rate = 3.4); 1/3.4 # media real de la población
tail(as.data.frame(m2))
1/4.1-1/3.4 # diferencia de medias real
```

estamos interesados en contrastar las hipótesis H0: mu1-mu2 = 0 *vs* H1: mu1-mu2 diferente de 0 (contraste de dos colas)

El valor observado del estadístico de prueba en este caso está dado por

```R
z0 <- (mean(m1)-mean(m2)-0)/sqrt(var(m1)/56 + var(m2)/63)
z0
```

que proviene de una distribución normal estándar aproximadamente.

Supongamos que estamos interesados en encontrar la región de rechazo (de dos colas) con un nivel de significancia alpha = 0.05, debemos encontrar el valor z_{0.025} que satisface P(Z > z_{0.025}) = 0.025.

```R
(z.025 <- qnorm(p = 0.025, lower.tail = FALSE))
```

Como

```R
(z0 < -z.025) | (z0 > z.025)
```

fallamos en rechazar la hipótesis nula.

**p-value** El p-value lo podemos calcular como 

```R
(pvalue <- 2*pnorm(z0, lower.tail = FALSE))
```

```R
x <- seq(-4, 4, 0.01)
y <- dnorm(x)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad normal estándar", sub = expression(paste(mu == 0, " y ", sigma == 1)))

polygon(c(min(x), x[x<=-z0], -z0), c(0, y[x<=-z0], 0), col="purple")
axis(side = 1, at = -z0, font = 2, padj = 1, lwd = 2)

polygon(c(z0, x[x>=z0], max(x)), c(0, y[x>=z0], 0), col="purple")
axis(side = 1, at = z0, font = 2, padj = 1, lwd = 2)
```

#### Contraste de hipótesis con muestras pequeñas para mu y mu1 - mu2

#### Contraste de cola superior

Dada una muestra aleatoria de tamaño n = 15

```R
set.seed(124)
muestra <- rnorm(n = 15, mean = 175, sd = 6) 
tail(as.data.frame(muestra))
```

estamos interesados en contrastar las hipótesis H0: mu = 170 *vs* H1: mu > 170 (contraste de cola superior)

El valor observado del estadístico de prueba en este caso está dado por

```R
t0 <- (mean(muestra)-170)/(sd(muestra)/sqrt(15)) 
t0
```

que proviene de una distribución t de Student con n-1 = 14 grados de libertad (gl).

Supongamos que estamos interesados en encontrar la región de rechazo (de cola superior) con un nivel de significancia alpha = 0.05, debemos encontrar el valor t_{0.05} que satisface $P(T > t_{0.05}) = 0.05$, donde $T$ se distribuye como t de Student con n-1 = 14 gl.

```R
(t.05 <- qt(p = 0.05, df = 14, lower.tail = FALSE))
```

Como

```R
t0 > t.05
```

rechazamos la hipótesis nula

**p-value** El p-value lo podemos calcular como 

```R
(pvalue <- pt(t0, df = 14, lower.tail = FALSE))
```

```R
x <- seq(-5, 5, 0.01)
y <- dt(x, df = 14)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad t de Student, 14 gl")

polygon(c(t0, x[x>=t0], max(x)), c(0, y[x>=t0], 0), col="red")
axis(side = 1, at = t0, font = 2, padj = 1, lwd = 2)
```

```R
t.test(x = muestra,
       alternative = "greater",
       mu = 170)
```

#### Contraste de dos colas

Dada dos muestras aleatorias de tamaños n1 = 23 y n2 = 20

```R
set.seed(1776)
m1 <- rnorm(n = 23, mean = 175, sd = 3)
tail(as.data.frame(m1))
m2 <- rnorm(n = 20, mean = 160, sd = 3)
tail(as.data.frame(m2))
175-160 # diferencia de medias real
```

estamos interesados en contrastar las hipótesis H0: mu1-mu2 = 0 *vs* H1: mu1-mu2 diferente de 0 (contraste de dos colas)

El valor observado del estadístico de prueba en este caso está dado por

```R
t0 <- (mean(m1)-mean(m2)-0)/(sqrt((22*var(m1)+19*var(m2))/(23+20-2))*sqrt(1/23+1/20))
t0
```

que proviene de una distribución t de Student con 23 + 20 - 2 = 41 gl

Supongamos que estamos interesados en encontrar la región de rechazo (de dos colas) con un nivel de significancia alpha = 0.05, debemos encontrar el valor t_{0.025} que satisface P(T > t_{0.025}) = 0.025.

```R
(t.025 <- qt(p = 0.025, df= 41, lower.tail = FALSE))
```

Como

```R
(t0 < -t.025) | (t0 > t.025)
```

rechazamos la hipótesis nula.

**p-value** El p-value lo podemos calcular como 

```R
(pvalue <- 2*pt(t0, df = 41, lower.tail = FALSE))
```

```R
t.test(x = m1, y = m2,
       alternative = "two.sided",
       mu = 0, paired = FALSE, var.equal = TRUE)
```
