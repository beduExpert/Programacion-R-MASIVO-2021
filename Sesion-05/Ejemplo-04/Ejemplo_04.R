# Ejemplo 4. Máquinas de Vectores de Soporte

#### Clasificador de vectores de soporte

# Cargamos el paquete `e1071` para ajustar máquinas de vectores de soporte


# install.packages("e1071") para instalarlo
library(e1071) 


###
  
# Generamos observaciones correspondientes a dos clases


set.seed(754)
x <- matrix(rnorm(30*2), ncol = 2)
y <- c(rep(-1, 15), rep(1, 15))
x[y == 1, ] <- x[y == 1, ] + 1


###
  
  
plot(x, col = (3-y), pch = 16)


###
  
# Creamos un data frame con la respuesta como factor


dat <- data.frame(x = x, y = as.factor(y))
tail(dat)


###
  
# Ajustamos el clasificador de vectores de soporte con la función `svm`


svmfit <- svm(y~., data = dat, kernel = "linear", 
              cost = 10, scale = FALSE)


# Acontinuación, mostramos el clasificador de vectores de soporte junto con las observaciones. Los vectores de soporte se muestran como $x's$

###


plot(svmfit, dat)


###

# También podemos observar los índices (números de filas en el data frame) que corresponden a vectores de soporte


svmfit$index



length(svmfit$index)


###

# Mostramos un breve resumen del ajuste

summary(svmfit)


###

# Volvemos a realizar el ajuste pero ahora con el valor del parámetro `cost = 0.1`


svmfit <- svm(y~., data = dat, kernel = "linear", 
cost = 0.1, scale = FALSE)


###


plot(svmfit, dat)


###

# Tenemos más vectores de soporte


length(svmfit$index)

svmfit$index

###

# El siguiente comando indica que queremos comparar MVS con un kernel lineal, usando un rago de valores del parámetro `cost`

set.seed(524)
tune.out <- tune(svm, y~., data = dat, kernel = "linear", 
ranges = list(cost = c(0.001, 0.01, 0.1, 1, 5, 10, 100)))


###

summary(tune.out)


###

# Elegimos el mejor modelo ajustado


bestmod <- tune.out$best.model


###


summary(bestmod)


###

# Ahora consideramos un conjunto de datos de prueba


xtest <- matrix(rnorm(45*2), ncol = 2)
ytest <- sample(c(-1, 1), 45, rep = TRUE)
xtest[ytest == 1, ] <- xtest[ytest == 1, ] + 1
testdat <- data.frame(x = xtest, y = as.factor(ytest))
tail(testdat)


###

# Realizamos una clasificación usando el mejor modelo ajustado y el conjunto de datos de prueba. Luego, mostramos la matriz de confusión


ypred <- predict(bestmod, testdat)
table(predict = ypred, truth = testdat$y)


###

#### Máquinas de vectores de soporte

# Generamos datos con una frontera de clase no lineal


set.seed(6891)
x <- matrix(rnorm(200*2), ncol = 2)
x[1:100,] <- x[1:100,] + 2
x[101:150,] <- x[101:150,] - 2
y <- c(rep(1, 150), rep(2, 50))
dat <- data.frame(x = x, y = as.factor(y))
head(dat)


###


plot(x, col = y, pch = 16)


###

# Generamos índices para el conjunto de entrenamiento

train <- sample(200, 100)
tail(as.data.frame(train))


###

# Ajustamos una máquina de vectores de soporte con un kernel radial y valores de los parámetros `gamma = 1` y `cost = 1`

svmfit <- svm(y~., data = dat[train, ], 
kernel = "radial", gamma = 1, cost = 1)


###


plot(svmfit, dat[train, ])


###

summary(svmfit)

###

# Ajustamos una máquina de vectores de soporte con un kernel radial y valores de los parámetros `gamma = 1` y `cost = 1e5`

svmfit <- svm(y~., data = dat[train, ], 
kernel = "radial", gamma = 1, cost = 1e5)


###


plot(svmfit, dat[train, ])


###

# Ajustamos máquinas de vectores de soporte con un kernel radial para diferentes valores de los parámetros `cost` y `gamma`

set.seed(1980)
tune.out <- tune(svm, y~., data = dat[train, ], kernel = "radial", 
ranges = list(cost = c(0.1, 1, 10, 100, 1000), 
gamma = c(0.5, 1, 2, 3, 4)))


###

summary(tune.out)


###

# Realizamos clasificación con el mejor modelo ajustado y obtenemos la matriz de confusión.

table(true = dat[-train, "y"], 
pred = predict(tune.out$best.model, newdata = dat[-train,]))

