# Ejemplo 4. Boxplots y outliers

#### Objetivo
- Generar y comprender los gráficos de tipo boxplot
- Introducción a la distribución de los datos

#### Requisitos
- Lectura de ficheros CVS
- Nociones básicas de ggplot

#### Desarrollo
Comenzamos leyendo un fichero, el cual contiene información sobre dos grupos de control G1 y G2, a los cuales se les realizó  a cada uno una medición en 3 momentos diferentes C1, C2 y C3

```R
# library(dplyr) # para usar mutate
data <- read.csv("../Sesion_03/boxp.csv")
```

Revisamos el encabezado del fichero y el nombre de sus variables o columnas
```R
head(data)
names(data)
```

Observamos algunos datos estadísticos sobre las variables
```R
summary(data)
```

Como estamos ante la presencia de `NA´s` los eliminamos con `na.omit()` y solamente seleccionamos aquellos sin `NA` y convertimos en factores la variable `Categoria` y `Grupo` , finalmente observa la estructura del df.

```R
data <- na.omit(data)
data <- mutate(data, Categoria = factor(Categoria), Grupo = factor(Grupo))
str(data) 
```

Ahora realizamos el boxplot para observar como se distribuyen los datos por grupo y categoría.
```R
ggplot(data, aes(x = Categoria, y = Mediciones, fill = Grupo)) + geom_boxplot() +
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones")
```

Agregamos el nombre de las etiquetas para los grupos G1 y G2
```R
ggplot(data, aes(x = Categoria, y = Mediciones, fill = Grupo)) + geom_boxplot() +
  scale_fill_discrete(name = "Dos Gps", labels = c("G1", "G2")) + 
  ggtitle("Boxplots") +
  xlab("Categorias") +
  ylab("Mediciones")
```
