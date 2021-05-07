# Ejemplo 3. Máquinas de vectores de soporte (Compañía de tarjetas de crédito)

#### Objetivo

- Clasificar clientes potenciales de una compañía de tarjetas de crédito usando máquinas de vectores de soporte

#### Requisitos

- Tener instalados R y RStudio
- Haber trabajado con el Prework

#### Desarrollo

Paquetes de R utilizados

```R
suppressMessages(suppressWarnings(library(dplyr)))
suppressMessages(suppressWarnings(library(e1071)))
suppressMessages(suppressWarnings(library(ggplot2)))
suppressMessages(suppressWarnings(library(ISLR)))
```

1. Observemos algunas características del data frame Default del paquete ISLR, con funciones tales como head, tail, dim y str.

```R
?Default
head(Default)
tail(Default)
dim(Default)
str(Default)
```

2. Usando ggplot del paquete ggplot2, realicemos un gráfico de dispersión con la variable balance en el eje x, la variable income en el eje y, diferenciando las distintas categorías en la variable default usando el argumento colour. Lo anterior para estudiantes y no estudiantes usando facet_wrap.

```R
ggplot(Default, aes(x = balance, y = income, colour = default)) + 
  geom_point() + facet_wrap('student') + 
  theme_grey() + ggtitle("Datos Default")
```

3. Generemos un vector de índices llamado train, tomando de manera aleatoria 5000 números de los primeros 10,000 números naturales, esto servirá para filtrar el conjunto de entrenamiento y el conjunto de prueba del data frame Default. Realicemos el gráfico de dispersión análogo al punto 2, pero para los conjuntos de entrenamiento y de prueba.

```R
set.seed(2020)
train = sample(nrow(Default), 
               round(nrow(Default)/2))
tail(Default[train, ])

ggplot(Default[train, ], 
       aes(x = balance, y = income, colour = default)) + 
  geom_point() + facet_wrap('student') + 
  theme_dark() + ggtitle("Conjunto de entrenamiento")

ggplot(Default[-train, ], 
       aes(x = balance, y = income, colour = default)) + 
  geom_point() + facet_wrap('student') + 
  theme_light() + ggtitle("Conjunto de prueba")
```

4. Ahora utilicemos la función tune junto con la función svm para seleccionar el mejor modelo de un conjunto de modelos, los modelos considerados serán aquellos obtenidos al variar los valores de los parámetros cost y gamma (usaremos un kernel radial). __Nota: se recomienda mucho correr el código que combina la función `tune` y la función `svm` antes de la sesión del work, esto porque se requiere "mucho" tiempo para que se obtengan los resultados__

```R
# Ahora utilizamos la función `tune` junto con la función `svm` para 
# seleccionar el mejor modelo de un conjunto de modelos, los modelos 
# considerados son aquellos obtenidos al variar los valores de los 
# parámetros `cost` y `gamma`. Kernel Radial

#tune.rad = tune(svm, default~., data = Default[train,], 
#                kernel = "radial", 
#                ranges = list(
#                  cost = c(0.1, 1, 10, 100, 1000), 
#                  gamma = seq(0.01, 10, 0.5)
#                ) 
#)

# Se ha elegido el mejor modelo utilizando *validación cruzada de 10 
# iteraciones*

# summary(tune.rad)

# Aquí un resumen del modelo seleccionado

# summary(tune.rad$best.model)

# A continuación solo usamos los valores de cost y gamma que producen el menor error de prueba estimado, considerando los conjuntos de valores en el código anterior

best <- svm(default~.,  data = Default[train,],
            kernel = "radial",
            cost = 100,
            gamma = 1.51
            )
```

5. Con el mejor modelo seleccionado y utilizando el conjunto de prueba, obtengamos una matriz de confusión, para observar el número de aciertos y errores cometidos por el modelo. También obtengamos la proporción total de aciertos y la matriz que muestre las proporciones de aciertos y errores cometidos pero por categorías.

```R
mc <- table(true = Default[-train, "default"], 
            pred = predict(best, 
                           newdata = Default[-train,]))
mc

# El porcentaje total de aciertos obtenido por el modelo usando el 
# conjunto de prueba es el siguiente

round(sum(diag(mc))/sum(colSums(mc)), 5)

# Ahora observemos las siguientes proporciones

rs <- apply(mc, 1, sum)
r1 <- round(mc[1,]/rs[1], 5)
r2 <- round(mc[2,]/rs[2], 5)
rbind(No=r1, Yes=r2)
```

6. Ajustemos nuevamente el mejor modelo, pero ahora con el argumento decision.values = TRUE. Obtengamos los valores predichos para el conjunto de prueba utilizando el mejor modelo, las funciones predict, attributes y el argumento decision.values = TRUE dentro de predict.

```R
fit <- svm(default ~ ., data = Default[train,], 
           kernel = "radial", cost = 100, gamma = 1.51,
           decision.values = TRUE)

fitted <- attributes(predict(fit, Default[-train,], 
                             decision.values = TRUE))$decision.values
```

7. Realicemos clasificación de las observaciones del conjunto de prueba utilizando los valores predichos por el modelo y un umbral de decisión igual a cero. También obtengamos la matriz de confusión y proporciones como anteriormente hicimos.

```R
eti <- ifelse(fitted < 0, "Yes", "No")

mc <- table(true = Default[-train, "default"], 
            pred = eti)
mc

round(sum(diag(mc))/sum(colSums(mc)), 5)

rs <- apply(mc, 1, sum)
r1 <- round(mc[1,]/rs[1], 5)
r2 <- round(mc[2,]/rs[2], 5)
rbind(No=r1, Yes=r2)
```

8. Repitamos el paso 7 pero con un umbral de decisión diferente, de tal manera que se reduzca la proporción del error más grave para la compañía de tarjetas de crédito.

```R
eti <- ifelse(fitted < 1.002, "Yes", "No")

mc <- table(true = Default[-train, "default"], 
            pred = eti)
mc

round(sum(diag(mc))/sum(colSums(mc)), 5)

rs <- apply(mc, 1, sum)
r1 <- round(mc[1,]/rs[1], 5)
r2 <- round(mc[2,]/rs[2], 5)
rbind(No=r1, Yes=r2)
```
