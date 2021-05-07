
# Reto 2. Máquinas de vectores de soporte

### OBJETIVO 

- Crear un conjunto de entrenamiento y uno de prueba a partir de un conjunto de datos dado
- Ajustar máquinas de vectores de soporte a un conjunto de entrenamiento
- Llevar a cabo clasificación con un conjunto de prueba y crear la matriz de confusión

#### REQUISITOS 

- Haber realizado el prework
- Replicar los ejercicios de la sesión  

#### DESARROLLO

En el archivo de datos csv adjunto se encuentran observaciones correspondientes a dos clases diferentes indicadas por la variable `y`. Únicamente hay dos variables predictoras o características. A continuación realice los siguientes requerimientos (Hint: transforme primero la variable de respuesta `y` a variable categórica con las funciones `mutate` y `factor`):

1. Carga los paquetes `ggplot2` y `e1071`; observe algunas características del data frame con las funciones `tail` y `dim`. Obtenga el gráfico de dispersión de los datos diferenciando las dos clases.

2. Genera de manera aleatoria un vector de índices para filtrar un conjunto de entrenamiento a partir del conjunto de datos dado. Con ayuda de las funciones `tune` y `svm` ajuste máquinas de vectores de soporte con un kernel radial a los datos de entrenamiento, para valores del parámetro `cost` igual a 0.1, 1, 10, 100, 1000 y valores del parámetro `gamma` igual a 0.5, 1, 2, 3, 4. Obtenga un resumen de los resultados.

3. Con el modelo que tuvo el mejor desempeño en el paso anterior realiza clasificación con la función `predict` y el conjunto de datos de prueba. Muestre la matriz de confusión.
