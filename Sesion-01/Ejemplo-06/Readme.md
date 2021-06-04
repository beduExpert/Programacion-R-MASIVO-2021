# EJEMPLO 6. Loops y pseudocódigo: _for_, _while_, _if_, _else_, _if-else_

# Objetivo
- Conocer la inicialización de variables 
- Ejecutar un loop, for, while, if y if-else

# Requisitos
1. Haber estudiado el prework
2. Tener previamente instalados R y RStudio 

# Desarrollo
Durante este ejemplo se darán las bases para generar un loop _for_, adicionalmente se utilizarán los comandos _while_, _if_ y _if-else_ para poder aplicarlos adecuadamente.

Este ejemplo se elevarán al cuadrado las entradas de un vector cualquiera w

```R
w <- c(2,4,6,8,10)

print("Este loop calcula el cuadrado de los elementos del vector w")

for(i in 1:length(w) ) {
  w.sq <- w[i]**2
  print(w.sq)
}
```

Los bucles WHILE comienzan comprobando una condición. Si esta es verdadera, entonces se entra al cuerpo del bucle. Una vez completada una ejecución de este bloque, se comprueba la condición nuevamente y así sucesivamente hasta que la comprobación de la condición de falso.

```
while(<condicion>) {
  # código
  ...
}
```
Ejemplo:

```R
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}
```

Pseudocódigo para IF - ELSE
```R
if(<condicion>) {
  ## bloque de código
}

## Continua con el resto del código
if(<condicion>) {
  ## bloque de código
} else {
  ## otro bloque de código
}

if(<condition1>) {
  ## bloque de código
} else if(<condicion2>) {
  ## otro bloque de código
} else {
  ## otro bloque de código
}
```
Ejemplo
```R
(x <- runif(1, 0, 10)) ## creamos un número aleatorio entre 0 y 10

if(x > 5) {
  y <- TRUE
  print(paste(y, ", x=", round(x,2) ,"> 5"))
  } else {
  y <- FALSE
  print(paste(y, ", x=", round(x,2) ," < 5"))
  }

```
De este modo estamos asignando un valor a una variable en función del valor de otra. Lo que se debe tener en cuenta es que la condición debe retornar un valor TRUE o FALSE.
