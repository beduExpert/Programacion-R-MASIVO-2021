# EJEMPLO 6. Loops y pseudocódigo: for, while, if, else, if-else

# Objetivo
# Conocer la inicialización de variables
# Ejecutar un loop, for, while, if y if-else
  
# Requisitos
# R, RStudio
# Prework

# Desarrollo
# Durante este ejemplo se darán las bases para inicializar una variable que sea utilizada dentro de un loop, adicionalmente se utilizaran los comandos while, if y if-else para poder utilizarlos adecuadamente

# Este ejemplo se elevarán al cuadrado las entradas de un vector cualquiera

w <- c(2,4,6,8,10)
print("Este loop calcula el cuadrado de los elementos del vector w")
for(i in 1:length(w) ) {
  w.sq <- w[i]**2
  print(w.sq)
}

# Los bucles WHILE comienzan comprobando una condición. Si esta es verdadera, entonces se entra al cuerpo del bucle. Una vez completada una ejecución de este bloque, se comprueba la condición nuevamente y así sucesivamente hasta que la comprobación de la condición de falso.

# while(<condicion>) {
#                     código
#                     ...
#             }

# Ejemplo:
  
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}
  
# Pseudocódigo para IF - ELSE

# if(<condicion>) {
  ## bloque de código
# }

## Continua con el resto del código

# if(<condicion>){
                  ## bloque de código
#               } else {
                        ## otro bloque de código
#                      }

# if(<condition1>) {
                     ## bloque de código
#                 } else if(<condicion2>) {
                                           ## otro bloque de código
#                                        } else {
                                                 ## otro bloque de código
#                                               }

# Ejemplo

(x <- runif(1, 0, 10)) ## creamos un número aleatorio entre 0 y 10

if(x > 5) {
  y <- TRUE
  print(paste(y, ", x=", round(x,2) ,"> 5"))
  } else {
  y <- FALSE
  print(paste(y, ", x=", round(x,2) ," < 5"))
  }



# De este modo estamos asignando un valor a una variable en función del valor de otra. Lo que se debe tener en cuenta es que la condición debe retornar un valor TRUE o FALSE.
