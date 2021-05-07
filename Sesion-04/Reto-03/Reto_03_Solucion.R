# Reto 3. Contraste de hipótesis

# Dada una muestra aleatoria de tamaño n = 10 de la distribución normal

set.seed(124)
muestra <- rnorm(n = 10, mean = 110, sd = 7) 
tail(as.data.frame(muestra))

# estamos interesados en contrastar las hipótesis H0: mu = 120 vs H1: mu < 120 (contraste de cola inferior).

# 1. Decida si rechazar o no la hipótesis nula si el nivel de significancia es alpha = 0.05
# 2. Obtenga el p-value de la prueba
# 3. Lleve a cabo la prueba con la función t.test


# **Solución**
  
#### Contraste de cola inferior
  
# El valor observado del estadístico de prueba en este caso está dado por

t0 <- (mean(muestra)-120)/(sd(muestra)/sqrt(10)) 
t0

# que proviene de una distribución t de Student con n - 1 = 9 grados de libertad (gl).

# estamos interesados en encontrar la región de rechazo (de cola inferior) con un nivel de significancia alpha = 0.05, debemos encontrar el valor t0.05 que satisface P(T < t0.05) = 0.05, donde T se distribuye como t de Student con n-1 = 9 gl.

(t.05 <- qt(p = 0.05, df = 9))

# Como

t0 < t.05

# rechazamos la hipótesis nula

# **p-value** El p-value lo podemos calcular como 

(pvalue <- pt(t0, df = 9)) # 2.

t.test(x = muestra, # 3.
       alternative = "less",
       mu = 120)
