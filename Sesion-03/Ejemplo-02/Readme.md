# Ejemplo 2. Histogramas

#### Objetivo
- Generar histogramas de datasets
- Cambiar propiedades de los histogramas 
- Comparar entre `hist()` y `ggplot`

#### Requisitos
- Tener previamente instalados R y Rstudio
- Manipulación de datos con R
- Lectura de ficheros

#### Desarrollo

Vamos a comenzar realizando la carga de los _datasets_ y librerias necesarias, como se muestra a continuación: 
```R
library(dplyr) # Para usar el operador %>%
data <- read.csv("../Sesion-03/Data/boxp.csv")
head(data)
names(data)
```

Modificamos una columna para ocultar los datos reales en caso de compartirlos 

```R
data <- mutate(data2, Mediciones = Mediciones*1.23) # se multilica por un factor la columna
head(data)
```
Podemos revertir esto dividiendo entre el fator 1.23
```R
data3 <- mutate(data, Mediciones = Mediciones/1.23) # se regresa a su valor original
head(data3)
``` 

Utilizando la función `hist`

```R
hist(data$Mediciones, breaks = (seq(0,300, 20)), 
     main = "Histograma de Mediciones",
     xlab = "Mediciones",
     ylab = "Frecuencia")
```

Ahora utilizando `ggplot` para apreciar los resultados de las dos funciones

```R
#Evitar el Warning de filas con NA´s
data <- na.omit(data) 

data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 10)
```

Agregando algunas etiquetas y tema, intenta modificar algunas de las opciones para que aprecies los resultados

```R
data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 10, col="black", fill = "blue") + 
  ggtitle("Histograma de Mediciones") +
  ylab("Frecuencia") +
  xlab("Mediciones") + 
  theme_light()
```

Tanto `hist()`, como `ggplot() + aes() + geom_histogram()` son útiles para generar los histogramas, tú decide cual te funciona mejor.  

