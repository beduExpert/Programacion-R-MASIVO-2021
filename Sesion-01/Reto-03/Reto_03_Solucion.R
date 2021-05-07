# Reto 3

# generando el vector de 44 posiciones aleatorio

ran <- rnorm(44)

# creando el loop que eleva al cubo y suma 12 a cada posición 
el <- vector()
for (i in 1:15) {
  el[i] <- (ran[i]^3) + 12
  print(el)
}

# Se almacenan los valores en un data frame
df.al <- data.frame(ran = ran[1:15], 
                    val = el)
df.al

# pseudocódigo 

# ran <- {se genera el vetor con rnorm de 44 entradas}
# 
# el <- {se inicializa un vector donde se almacenará el resultado}
# 
# for (contador desde 1 hasta 15 ){
#   el[contador] <- operación aritmética
#   se imprime el resultado (el)
# }

