# Ejemplo 3. Gráficos de dispersión (scatter plots)  

#### Objetivo
- Desarrollar habilidades para realizar e interpretar scatter plots
- Utilizar diferentes funciones de `ggplot` 
- Variantes de scatter plots

#### Requisitos
- Tener conceptos básicos de gráficación 
- Haber realizado el prework

#### Desarrollo

Realizamos un scatter plot de las variables `wt` y `mpg`, debemos utilizar necesariamente `geom_point()`
```R
(my_scatplot <- ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point())
```

Adicionalmente se puede agregar una línea de tendencia 
```R
(my_scatplot <- ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = T))  # modelo lineal, cambia el parametro `se`, este hace referencia al intervalo de confianza
```
Agregando los nombres de los ejes, observa que se almacenó el gráfico en el objeto **my_scatplot** (nota que pueden agregarse más características seguido del signo `+`)

```R
my_scatplot + xlab('Weight (x 1000lbs)') + ylab('Miles per Gallon')
```

Otras características interesantes

```R
(my_scatplot <- ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point())
my_scatplot + labs(x = 'Weight (x1000lbs)', y = 'Miles per Gallon', colour = 'Number of\n Cylinders')
```

Haciendo un facewrap con la variable `cyl`
```R
my_scatplot + facet_wrap("cyl")
```
Separándolas por tipo de transmisión (am =	Transmission (0 = automatic, 1 = manual))
```R
my_scatplot + facet_grid(am~cyl)
```

Como puedes observar, hay muchas formas de representar el gráfico de dispersión, éstas son algunas de ellas, obviamente existen muchas más. 
