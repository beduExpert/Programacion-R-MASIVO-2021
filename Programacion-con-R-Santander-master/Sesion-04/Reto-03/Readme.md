# RETO 3. Contraste de hipótesis

#### Objetivo

- Llevar a cabo un contraste de hipótesis acerca de la media de una población normal cuando el tamaño muestral es pequeño.

#### Requisitos

- Haber trabajado con el Prework y el Work

#### Desarrollo

Dada una muestra aleatoria de tamaño n = 10 de una distribución normal

```R
set.seed(124)
muestra <- rnorm(n = 10, mean = 110, sd = 7) # muestra pequeña
tail(as.data.frame(muestra))
```

estamos interesados en contrastar las hipótesis H0: mu = 120 *vs* H1: mu < 120 (contraste de cola inferior).

1. Decida si rechazar o no la hipótesis nula si el nivel de significancia es alpha = 0.05
2. Obtenga el p-value de la prueba
3. Lleve a cabo la prueba con la función `t.test`
