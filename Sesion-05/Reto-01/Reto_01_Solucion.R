# Reto 1. Regresión lineal simple

# Se cree que entre las variables x y y del archivo csv adjunto, podría haber una relación más o menos lineal. Para tener más evidencia sobre esto lleve a cabo lo siguiente:
  
# 1. Realice el gráfico de dispersión de los datos
# 2. Ajuste un modelo de regresión lineal simple a los datos, muestre un resumen del modelo ajustado y trace la recta de regresión estimada junto con el gráfico de dispersión
# 3. Obtenga algunas gráficas de diagnóstico y diga si es razonable suponer para los errores aleatoriedad, normalidad y varianza constante.

# **Solución**

# Establezca primero un directorio de trabajo donde
# deberán estar los datos a importar
rm(list = ls()) # Para eliminar objetos creados previamente
datos <- read.csv("datoslineal.csv")
attach(datos)

plot(x, y, main = "Gráfico de dispersión") # 1

modelo <- lm(y ~ x) # 2.
summary(modelo)
abline(lsfit(x, y))

par(mfrow = c(2, 2)) 
plot(modelo) # 3.

