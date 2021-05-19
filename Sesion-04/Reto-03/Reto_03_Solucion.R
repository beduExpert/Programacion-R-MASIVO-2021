# Reto 3. Contraste de hipótesis

# El vicepresidente de ventas de una gran empresa afirma que los vendedores 
# están promediando no más de 15 contactos de venta por semana. 
# (Le gustaría aumentar esa cantidad.) Como prueba de su afirmación, 
# aleatoriamente se seleccionan n = 20 vendedores y se registra el número de 
# contactos hechos por cada uno para una sola semana seleccionada al azar.

muestra <- c(V1 = 13, V2 = 17, V3 = 20, V4 = 17, V5 = 20, V6 = 20, V7 = 18, 
             V8 = 18, V9 = 16, V10 = 19, V11 = 13, V12 = 17, V13 = 15, 
             V14 = 19, V15 = 16, V16 = 19, V17 = 22, V18 = 10, V19 = 13, 
             V20 = 21)

# ¿La evidencia contradice lo dicho por el vicepresidente? 
# Use una prueba con nivel alpha = 0.05.

# 1. Establezca las hipótesis nula y alternativa. ¿Es una prueba de cola superior, de cola inferior o de dos colas?
# 2. Decida si rechazar o no la hipótesis nula si el nivel de significancia es alpha = 0.05
# 3. Obtenga el p-value de la prueba
# 4. Lleve a cabo la prueba con la función t.test


# **Solución**
  
### Contraste de cola superior

# 1. Estamos interesados en contrastar las hipótesis 
#    H0: mu = 15 vs H1: mu > 15 (contraste de cola superior)

# 2. El valor observado del estadístico de prueba en este caso está dado por

t0 <- (mean(muestra)-15)/(sd(muestra)/sqrt(20)) 
t0

# que proviene de una distribución t de Student con n-1 = 19 grados de libertad (gl).

# Estamos interesados en encontrar la región de rechazo (de cola superior) 
# con un nivel de significancia alpha = 0.05, debemos encontrar el valor 
# t_{0.05} que satisface P(T > t_{0.05}) = 0.05, donde T se distribuye como t 
# de Student con n-1 = 19 gl.

(t.05 <- qt(p = 0.05, df = 19, lower.tail = FALSE))

# Como

t0 > t.05

# rechazamos la hipótesis nula.

# 3. El p-value lo podemos calcular como

(pvalue <- pt(t0, df = 19, lower.tail = FALSE))

x <- seq(-5, 5, 0.01)
y <- dt(x, df = 19)
plot(x, y, type = "l", xlab="", ylab="")
title(main = "Densidad t de Student, 19 gl")

polygon(c(t0, x[x>=t0], max(x)), c(0, y[x>=t0], 0), col="red")
axis(side = 1, at = t0, font = 2, padj = 1, lwd = 2)

# 4. También podemos usar la función t.test para llevar a cabo el procedimiento de contraste de hipótesis

t.test(x = muestra,
       alternative = "greater",
       mu = 15)
