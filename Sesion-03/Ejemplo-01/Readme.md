# Ejemplo 1.  Paquete ggplot2

#### Objetivo
- Generar gráficos atractivos 
- Aprender la sintaxis del paquete ggplot

#### Requisitos
- Haber realizado la lectura y comprensión del prework
- Manejo de data frames
- Analizar el código que se va mostrando y tratar de comprender la sintaxis


#### Desarrollo

Comenzando con gráficos simples; vamos a utilizar el dataset `mtcars`. 


Instalamos el paquete (si es necesario) y lo cargamos
```R 
library(ggplot2)
```

Primero recordamos cuales son las variables que contiene el dataset
```R
names(mtcars)
``` 
Graficamos las variables `cyl` en el eje _x_ y `hp` en _y_, observa el comando :arrow_right: `geom_point()`
```R
ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point()  # Tipo de geometría, intenta utilizar alguna otra
```

Agregando carácteristicas de tema y facewrap
```R
names(mtcars)
ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl")  # Lo divide por el núm de cilindros
``` 

Agregando nombres a los ejes _x_, _y_
```R
names(mtcars)
ggplot(mtcars, aes(x=cyl, y = hp, colour = mpg )) + 
  geom_point() +   
  theme_gray() +   # Temas (inteta cambiarlo)
  facet_wrap("cyl") +  # Lo divide por el núm de cilindros
  xlab('Núm Acilindros')+  # Nombre en los ejes
  ylab('Caballos de Fuerza')
```
Adicionalmente se pueden realizar otros tipos de gráficos, estos se verán en los próximos ejemplos.
