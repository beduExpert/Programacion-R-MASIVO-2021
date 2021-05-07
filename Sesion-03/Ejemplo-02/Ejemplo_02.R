library(dplyr) # Para usar el operador %>%
data <- read.csv("../Sesion-03/Data/boxp.csv")
head(data)
names(data)

# Utilizando la función hist

hist(data$Mediciones, breaks = seq(0,300, 20), 
     main = "Histograma de Mediciones",
     xlab = "Mediciones",
     ylab = "Frecuencia")

# Ahora utilizando ggplot para apreciar los resultados de las dos funciones

# Evitar el Warning de filas con NA´s

data <- na.omit(data) 

data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 10)

# Agregando algunas etiquetas y tema, intenta modificar algunas de las opciones para que aprecies los resultados

data %>%
  ggplot() + 
  aes(Mediciones) +
  geom_histogram(binwidth = 10, col="black", fill = "blue") + 
  ggtitle("Histograma de Mediciones") +
  ylab("Frecuencia") +
  xlab("Mediciones") + 
  theme_light()

# Tanto hist(), como ggplot() + aes() + geom_histogram() son útiles para generar los histogramas, tu decide cual te funciona mejor.

