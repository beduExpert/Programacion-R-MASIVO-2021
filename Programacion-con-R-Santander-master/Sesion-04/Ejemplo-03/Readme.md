# EJEMPLO 3. Algunos estimadores puntuales insesgados comunes

#### Objetivo

- Entender la idea de estimador insesgado de un parámetro

#### Requisitos

- Tener `R` y RStudio instalados
- Haber leido el Prework

#### Desarrollo

#### *Nota: este ejemplo es opcional por su similaridad con el ejemplo sobre el teorema central del límite*

Cargamos el paquete `ggplot2` para hacer algunas gráficas

```R
library(ggplot2)
```

Consideremos una variable aleatoria (v.a.) X con distribución exponencial y parámetro lambda = 3

```R
x <- seq(0, 5, 0.02)
plot(x, dexp(x, rate = 3), type = "l", lwd = 2, ylab = "")
title(main = "Función de Densidad Exponencial", ylab = "f(x)",
      sub = expression("Parámetro " ~ lambda == 3))
text(x = 3, y = 1.5, labels = expression(f(x)==3*exp(-3*x) ~ " para x "  >= 0))
text(x = 3, y = 1.3, labels = paste("0 en otro caso"))
text(x = 1, y = 1, labels = expression("E(X) = " ~ 1/lambda == 1/3), col = 2)
text(x = 3, y = 0.5, labels = expression("DE(X) = " ~ 1/lambda == 1/3), col = 4)
```

Obtenemos 1200 muestras aleatorias de tamaño 350 y las 1200 medias correspondientes a las muestras

```R
set.seed(65) # Para reproducir las muestras en el futuro
m1200.350 <- sapply(X = rep(350, 1200), FUN = rexp, rate = 3)
media1200.350 <- apply(m1200.350, 2, mean)
mdf <- as.data.frame(media1200.350)
tail(mdf)
```

Observamos que el histograma de las medias tiene forma de campana

```R
ggplot(mdf, aes(media1200.350)) + 
  geom_histogram(colour = 'yellow', 
                 fill = 'purple',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1200.350), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1200 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_get() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
```

```R
mean(media1200.350); 1/3 # Media de las 1200 medias y media de la población de la cual provienen las 1200 muestras
sd(media1200.350); (1/3)/sqrt(350) # DE de las 1200 medias y DE de la población de la cual provienen las 1200 muestras dividida por la raíz del tamaño de las muestras
```

**Ensayo Bernoulli**. Con las siguientes instrucciones obtenemos un solo valor, en donde el 0 (fracaso) puede ocurrir con probabilidad 0.45 y el 1 (éxito) con probabilidad p = 0.55

```R
set.seed(345)
sample(x = c(0, 1), size = 1, prob = c(0.45, 0.55))
rbinom(n = 1, size = 1, prob = 0.55)
```

Obtenemos 1000 muestras de tamaño 31 de una v.a. Bernoulli con p = 0.55

```R
set.seed(5434) # Para reproducir las muestras en el futuro
m1000.31 <- sapply(X = rep(31, 1000), FUN = function(n) sample(x = c(0, 1), size = n, replace = TRUE, prob = c(0.45, 0.55)))
media1000.31 <- apply(m1000.31, 2, mean)
mdf <- as.data.frame(media1000.31)
tail(mdf)
```

Observamos que el histograma de las medias es parecida a una campana

```{r, echo = FALSE}
ggplot(mdf, aes(media1000.31)) + 
  geom_histogram(colour = 'orange', 
                 fill = 'blue',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1000.31), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_grey() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
```

```{r}
mean(media1000.31); 0.55 # Media de las 1000 medias y media de la población de la cual provienen las 1000 muestras
sd(media1000.31); sqrt(0.55*0.45)/sqrt(31) # DE de las 1000 medias y DE de la población de la cual provienen las 1000 muestras dividida por la raíz del tamaño de la muestra
```

Obtenemos 1150 muestras aleatorias de tamaño n1 = 54 de una distribución exponencial con parámetro lambda1 = 3.2 y
otras 1150 muestras aleatorias de tamaño n2 = 41 de una distribución exponencial con  parámetro lambda2 = 1.5.

```R
set.seed(65) # Para reproducir las muestras en el futuro
m1150.54 <- sapply(X = rep(54, 1150), FUN = rexp, rate = 3.2)
media1150.54 <- apply(m1150.54, 2, mean)
m1150.41 <- sapply(X = rep(41, 1150), FUN = rexp, rate = 1.5)
media1150.41 <- apply(m1150.41, 2, mean)
dif.medias <- media1150.54 - media1150.41 # Diferencia de medias
dmdf <- as.data.frame(dif.medias)
tail(dmdf)
```

Observamos que el histograma de las **diferencias de medias** es parecida a una campana

```R
ggplot(dmdf, aes(dif.medias)) + 
  geom_histogram(colour = 'orange', 
                 fill = 'red',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(dif.medias), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 diferencias de medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_grey() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
```

```R
mean(dif.medias); 1/3.2-1/1.5 # Media de las 1150 diferencias de medias y diferencia de medias de las poblaciones de las cuales provienen las 11500 muestras

sd(dif.medias); sqrt((1/3.2^2)/54 + (1/1.5^2)/41) # DE de las 1150 diferencias de medias y DE dada en literatura
```

Obtenemos 1100 muestras de tamaño n1 = 48 de una v.a. Bernoulli con p1 = 0.65 y otras 1100 muestras de tamaño n2 = 35 de una v.a. Bernoulli con p2 = 0.53

```R
set.seed(7434) # Para reproducir las muestras en el futuro
m1100.48 <- sapply(X = rep(48, 1100), FUN = function(n) sample(x = c(0, 1), size = n, replace = TRUE, prob = c(0.35, 0.65)))
m1100.35 <- sapply(X = rep(35, 1100), FUN = function(n) sample(x = c(0, 1), size = n, replace = TRUE, prob = c(0.47, 0.53)))
media1100.48 <- apply(m1100.48, 2, mean)
media1100.35 <- apply(m1100.35, 2, mean)
dif.medias <- media1100.48 - media1100.35
dmdf <- as.data.frame(dif.medias)
tail(dmdf)
```

Observamos que el histograma de las diferencias de medias es parecida a una campana

```R
ggplot(dmdf, aes(dif.medias)) + 
  geom_histogram(colour = 'pink', 
                 fill = 'blue',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(dif.medias), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1100 diferencias de medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_grey() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
```

```R
mean(dif.medias); 0.65 - 0.53 # Media de las 1100 diferencias de medias y diferencia de medias de las poblaciones de las cuales provienen las muestras
sd(dif.medias); sqrt((0.65*0.35)/48 + (0.53*0.47)/35) # DE de las 1100 diferencias de medias y DE dada en literatura
```
