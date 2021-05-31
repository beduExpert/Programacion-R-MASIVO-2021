#      Ejemplo 2- Matrices

# Objetivo

- Crear nuevas matrices
- Extraer datos dentro de una matriz
- Calcular sus dimensiones
- Realizar operaciones básicas entre matrices

# Requisitos

1. Tener instalados R y RStudio
2. Haber estudiado el Prework

# Desarrollo

Se debe seguir el código propuesto y tratar de comprender qué es lo que realiza


##### Crear matrices. 
```R
(m <- matrix(1:9, nrow = 3, ncol = 3))
```
Extrayendo la primera entrada
```R
m[1,1]
```

Extrayendo la primer columna, con todas sus filas
```R
m[ ,1]
```
¿Qué sucede si se suma un vector y una matriz?
```R
(sum.vecmat <- c(1,2) + m)
```

Creando otra matriz
```R
(n <- matrix(2:7, 4, 6))
```
Podemos conocer la dimensión de la matriz así 
```R
dim(n)
```

Extrayendo subconjuntos de la matriz
```R
n[n > 4] 
```

Ahora veremos como localizar la posición de las entradas anteriores
```R
which(n > 4)
```

Uniendo vectores para formar una matriz
```R
a <- 2:6
b <- 5:9
```

Algunas operaciones básicas de matrices que puede intentar son: 
   - 1. Producto matricial: A %*% B
   - 2. Producto elemento a elemento: A*B
   - 3. Traspuesta: t(A)  
   - 4. Determinante: det(A)
   - 5. Extraer la diagonal: diag(A)
   - 6. Resolver un sistema de ecuaciones lineales (\( Ax=b \)): solve(A,b)
   - 7. Inversa: solve(A)
   - 8. Autovalores y autovectores: eigen(A)
