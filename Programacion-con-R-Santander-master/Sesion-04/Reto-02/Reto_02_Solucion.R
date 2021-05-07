# Reto 2. Algunos estimadores puntuales insesgados comunes

# Nota: este reto es opcional

# 1. Genere 1500 muestras de tamaño 67 de la distribución exponencial con parámetro 5
# 2. Obtenga las 1500 medias correspondientes a cada una de las muestras
# 3. Realice el histograma de frecuencias de las 1500 medias
# 4. Encuentre la media muestral y desviación estándar muestral de las 1500 medias 
# 5. Compare la media muestral encontrada en el paso anterior con la media real (1/5) de la población de la cual provienen las muestras 
# 6. Compare la desviación estándar muestral encontrada con la desviación estándar real (1/5) de la población de la cual provienen las muestras pero dividida por 67 (el tamaño de las muestras)

# **Solución**
  
library(ggplot2)
set.seed(65) # 1.
m1500.67 <- sapply(X = rep(67, 1500), FUN = rexp, rate = 5)
media1500.67 <- apply(m1500.67, 2, mean) # 2.
mdf <- as.data.frame(media1500.67)
tail(mdf)

p <- ggplot(mdf, aes(media1500.67)) + # 3.
  geom_histogram(colour = 'yellow', 
                 fill = 'purple',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1500.67), 
             linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1500 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_get() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 

p

mean(media1500.67); sd(media1500.67) # 4.

mean(media1500.67); 1/5 # 5.
sd(media1500.67); (1/5)/sqrt(67) # 6.
