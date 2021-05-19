# RETO 3. Contraste de hipótesis

#### Objetivo

- Llevar a cabo un contraste de hipótesis acerca de la media de una población normal cuando el tamaño muestral es pequeño (`n < 30`).

#### Requisitos

- Haber trabajado con el Prework y el Work

#### Desarrollo

El vicepresidente de ventas de una gran empresa afirma que los vendedores están promediando no más de 15 contactos de venta por semana. (Le gustaría aumentar esa cantidad.) Como prueba de su afirmación, aleatoriamente se seleccionan `n = 20` vendedores y se registra el número de contactos hechos por cada uno para una sola semana seleccionada al azar.

```R
muestra <- c(V1 = 13, V2 = 17, V3 = 20, V4 = 17, V5 = 20, V6 = 20, V7 = 18, V8 = 18, V9 = 16, V10 = 19, 
             V11 = 13, V12 = 17, V13 = 15, V14 = 19, V15 = 16, V16 = 19, V17 = 22, V18 = 10, V19 = 13, V20 = 21)
```

¿La evidencia contradice lo dicho por el vicepresidente? Use una prueba con nivel alpha = 0.05.

1. Establezca las hipótesis nula y alternativa. ¿Es una prueba de cola superior, de cola inferior o de dos colas?
2. Decida si rechazar o no la hipótesis nula si el nivel de significancia es alpha = 0.05
3. Obtenga el p-value de la prueba
4. Lleve a cabo la prueba con la función `t.test`

Inspirado en Wackerly, D. et al. (2010). Estadística Matemática con Aplicaciones. Cengage Learning Editores, S.A. de C.V.
