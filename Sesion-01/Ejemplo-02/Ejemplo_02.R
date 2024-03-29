# Ejemplo 2. Matrices

# Objetivo

# Crear nuevas matrices
# Extraer datos dentro de una matriz
# Calcular sus dimensiones
# Realizar operaciones básicas entre matrices

# Requisitos

# Tener instalados R y RStudio
# Haber estudiado el Prework

# Desarrollo

# Se debe seguir el código propuesto y tratar de compreder que es lo que realiza

# Crear Matrices. 

(m <- matrix(1:9, nrow = 3, ncol = 3))

# Extrayendo la primera entrada

m[1,1]

# Extrayendo la primer columna, con todas sus filas

m[ ,1]

# ¿Qué sucede si se suma un vector y una matriz?

(sum.vecmat <- c(1, 2) + m)

# Creando otra matriz

(n <- matrix(2:7, 4, 6))

# Podemos conocer la dimensión de la matriz así

dim(n)

# Extrayendo subconjuntos de la matriz

n[n > 4] 

# Ahora veremos como localizar la posición de las entradas anteriores

which(n > 4)

# Algunas operaciones básicas de matrices

# Producto matricial: A %*% B
# Producto elemento a elemento: A*B
# Traspuesta: t(A)
# Determinante: det(A)
# Extraer la diagonal: diag(A)
# Resolver un sistema de ecuaciones lineales (( Ax=b )): solve(A,b)
# Inversa: solve(A)
# Autovalores y autovectores: eigen(A)
