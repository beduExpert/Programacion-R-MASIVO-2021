# EJEMPLO 5. Instalar paquetes y cargarlos.

# Objetivo
# Instalar paquetes
# Cargar paquetes

# Requisitos
# R y RStudio
# Prework

# Desarrollo
# En este ejemplo se te guiará para poder realizar la instalación y carga de paquetes que son requeridos para realizar análisis, gráficas, o para extraer información con diversas funciones. Esto es útil ya que agrega funcionalidades a R, ya sea para graficar o generar análisis con diversas técnicas.

# Se instalan de la siguiente manera

install.packages("ggplot2") #siempre lleva  comillas

# Una vez que se instaló, se debe de cargar

library(ggplot2) # Se omite el uso de las comillas

# Otro ejemplo

install.packages("dplyr")
library(dplyr)

# Algo útil es revisar la versión que se tiene de R, ya que en ocasiones no se instalan ciertos paquetes por la incompatibilidad de R, el siguiente comando nos indicará la versión que estamos trabajando.

version

# También se puede realizar esta acción en la pestaña de Packages, intentalo.