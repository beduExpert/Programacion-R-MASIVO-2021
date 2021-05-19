# Reto 2. Teorema central del límite

# Las calificaciones de exámenes para todos los estudiantes de último año de 
# preparatoria en cierto estado tienen media de 60 y varianza de 64. 
# Una muestra aleatoria de n = 100 estudiantes de una escuela preparatoria 
# grande tuvo una calificación media de 58. ¿Hay evidencia para sugerir que el 
# nivel de conocimientos de esta escuela sea inferior? 
# (Calcule la probabilidad de que la media de una muestra aleatoria sea a lo 
# sumo 58 cuando n = 100.)

# **Solución**
  
# Denote con Y_barra la media de una muestra aleatoria de n = 100 calificaciones 
# de una población con media: 60 y  varianza: 64. Por el Teorema Central del 
# Límite, Y_barra iene aproximadamente una distribución normal con media: 60 y 
# varianza: 64/100. Deseamos calcular P(Y_barra <= 58)

pnorm(58, mean = 60, sd = 8/10)

# Debido a que esta probabilidad es muy pequeña, no es probable que la muestra 
# de la escuela estudiada se pueda considerar como muestra aleatoria de una 
# población con media: 60 y varianza: 64. La evidencia sugiere que la calificación 
# promedio para esta preparatoria es menor que el promedio general de la población:60.

# Wackerly, D. et al. (2010). Estadística Matemática con Aplicaciones. 
# Cengage Learning Editores, S.A. de C.V.
