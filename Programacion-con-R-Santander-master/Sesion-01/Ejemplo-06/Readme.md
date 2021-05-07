# EJEMPLO 6. Loops y pseudocódigo: for, while, if, else, if-else

# Objetivo
- Conocer la inicialización de variables 
- Ejecutar un loop, for, while, if y if-else

# Requisitos
1. R, RStudio
2. Prework 

# Desarrollo
Durante este ejemplo se darán las bases para inicializar una variable que sea utilizada dentro de un loop, adicionalmente se utilizaran los comandos while, if y if-else para poder utilizarlos adecuadamente

Este ejemplo elevará al cuadrado las primeras 10 entradas de un vector generado aleatóriamente de 20 entradas 
```R
w <- rnorm(20)              
print("Este loop calcula el cuadrado de los 10 primeros elementos del vector w")
```
inicializando la varialbe `wsq`
```R
wsq <- 0

for(i in 1:10) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  wsq[i] <- w[i]**2
  print(wsq[i])
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
x <- runif(1, 0, 10) ## creamos un número aleatorio entre 0 y 10
if(x > 5) {
  y <- TRUE
} else {
  y <- FALSE
}
```
De este modo estamos asignando un valor a una variable en función del valor de otra. Lo que se debe tener en cuenta es que la condición debe retornar un valor TRUE o FALSE.
