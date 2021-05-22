# Reto 2. Máquinas de vectores de soporte

# En el archivo de datos csv adjunto se encuentran observaciones correspondientes a dos clases diferentes indicadas por la variable y. Únicamente hay dos variables predictoras o características. Realice lo siguiente:
  
# 1. Cargue los paquetes ggplot2 y e1071; observe algunas características del data frame con las funciones tail y dim. Obtenga el gráfico de dispersión de los datos diferenciando las dos clases.
# 2. Genere de manera aleatoria un vector de índices para filtrar un conjunto de entrenamiento a partir del conjunto de datos dado. Con ayuda de las funciones tune y svm ajuste máquinas de vectores de soporte con un kernel radial a los datos de entrenamiento, para valores del parámetro cost igual a 0.1, 1, 10, 100, 1000 y valores del parámetro gamma igual a 0.5, 1, 2, 3, 4. Obtenga un resumen de los resultados.
# 3. Con el modelo que tuvo el mejor desempeño en el paso anterior realice clasificación con la función predict y el conjunto de datos de prueba. Muestre la matriz de confusión.

# **Solución**

# Primero establecemos nuestro directorio de trabajo en donde
# deberán estar nuestros datos.

datos <- read.csv("datosclases.csv")

# 1. 

# Cargamos los paquetes `ggplot2` y `e1071`,
# observamos algunas características del data frame
# con las funciones `tail` y `dim`.

library(dplyr)
library(ggplot2)
library(e1071)

###

tail(datos); dim(datos); str(datos)
datos <- mutate(datos, y = factor(y))
# Obtenemos el gráfico de dispersión de los datos
# diferenciando las dos clases

ggplot(datos, aes(x = x.1, y = x.2, colour = y)) + 
  geom_point() + 
  theme_dark() + ggtitle("Datos")

###

# 2.

# Generamos índices para el conjunto de entrenamiento

train <- sample(300, 150)
tail(as.data.frame(train))

###

# Ajustamos máquinas de vectores de soporte con un kernel radial 
# para diferentes valores de los parámetros `cost` y `gamma`

set.seed(67)
tune.out <- tune(svm, y~., data = datos[train, ], 
                 kernel = "radial", 
                 ranges = list(cost = c(0.1, 1, 10, 100, 1000), 
                               gamma = c(0.5, 1, 2, 3, 4)))


### Obtenemos un resumen de los modelos ajustados y su desempeño

summary(tune.out)


###

# Realizamos clasificación con el mejor modelo ajustado y obtenemos la matriz de confusión.

table(true = datos[-train, "y"], 
      pred = predict(tune.out$best.model, newdata = datos[-train,]))

