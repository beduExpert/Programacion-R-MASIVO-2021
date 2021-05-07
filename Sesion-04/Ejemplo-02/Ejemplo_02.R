# Ejemplo 2. Teorema central del límite

# Cargamos el paquete ggplot2 para hacer algunas gráficas

library(ggplot2)
# Consideremos una variable aleatoria (v.a.) X con distribución exponencial y parámetro lambda = 2

x <- seq(0, 5, 0.02)
plot(x, dexp(x, rate = 2), type = "l", lwd = 2, ylab = "")
title(main = "Función de Densidad Exponencial", ylab = "f(x)",
      sub = expression("Parámetro " ~ lambda == 2))
text(x = 3, y = 1.5, labels = expression(f(x)==2*exp(-2*x) ~ " para x "  >= 0))
text(x = 3, y = 1.3, labels = paste("0 en otro caso"))
text(x = 1, y = 1, labels = expression("E(X) = " ~ 1/lambda == 1/2), col = 2)
text(x = 3, y = 0.5, labels = expression("DE(X) = " ~ 1/lambda == 1/2), col = 4)
# Ahora obtenemos una muestra aleatoria de tamaño n = 4 de la distribución exponencial considerada

set.seed(10) # Para reproducir posteriormente la muestra
(m1.4 <- rexp(n = 4, rate = 2))
# Obtenemos la media de la muestra generada

mean(m1.4)

# Ahora obtenemos 5 muestras de tamaño 3

set.seed(64) # Para reproducir las muestras en el futuro
(m5.3 <- sapply(X = rep(3, 5), FUN = rexp, 2))
# Obtenemos las medias de las 5 muestras

(media5.3 <- apply(m5.3, 2, mean))
# Ahora obtenemos 1000 muestras de tamaño 7 y las 1000 medias correspondientes a las muestras

set.seed(465) # Para reproducir las muestras en el futuro
m1000.7 <- sapply(X = rep(7, 1000), FUN = rexp, 2)
media1000.7 <- apply(m1000.7, 2, mean)
mdf <- as.data.frame(media1000.7)
tail(mdf)
# Observamos que el histograma de las medias tiene forma de campana

ggplot(mdf, aes(media1000.7)) + 
  geom_histogram(colour = 'green', 
                 fill = 'orange',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1000.7), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(media1000.7); 1/2 # Media de las 1000 medias y media de la población de la cual vienen las 1000 muestras
sd(media1000.7); (1/2)/sqrt(7) # DE de las 1000 medias y DE de la población de la cual vienen las 1000 muestras dividida por la raíz del tamaño de la muestra

# Ahora obtenemos 1000 muestras de tamaño 33 y las 1000 medias correspondientes a las muestras

set.seed(4465) # Para reproducir las muestras en el futuro
m1000.33 <- sapply(X = rep(33, 1000), FUN = rexp, 2)
media1000.33 <- apply(m1000.33, 2, mean)
mdf <- as.data.frame(media1000.33)
tail(mdf)
# Observamos que el histograma de las medias es más parecida todavía a una campana

ggplot(mdf, aes(media1000.33)) + 
  geom_histogram(colour = 'yellow', 
                 fill = 'purple',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1000.33), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_get() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(media1000.33); 1/2 # Media de las 1000 medias y media de la población de la cual vienen las 1000 muestras
sd(media1000.33); (1/2)/sqrt(33) # DE de las 1000 medias y DE de la población de la cual vienen las 1000 muestras dividida por la raíz del tamaño de la muestra

# Ahora obtenemos 1000 muestras de tamaño 400 y las 1000 medias correspondientes a las muestras

set.seed(543465) # Para reproducir las muestras en el futuro
m1000.400 <- sapply(X = rep(400, 1000), FUN = rexp, 2)
media1000.400 <- apply(m1000.400, 2, mean)
mdf <- as.data.frame(media1000.400)
tail(mdf)
# Observamos que el histograma de las medias es más parecida todavía a una campana

ggplot(mdf, aes(media1000.400)) + 
  geom_histogram(colour = 'orange', 
                 fill = 'gray',
                 alpha = 0.7) + # Intensidad del color fill
  geom_vline(xintercept = mean(media1000.400), linetype="dashed", color = "black") + 
  ggtitle('Histograma para las 1000 medias') + 
  labs(x = 'medias', y = 'Frecuencia')+
  theme_gray() +
  theme(plot.title = element_text(hjust = 0.5, size = 16)) 
mean(media1000.400); 1/2 # Media de las 1000 medias y media de la población de la cual vienen las 1000 muestras
sd(media1000.400); (1/2)/sqrt(400) # DE de las 1000 medias y DE de la población de la cual vienen las 1000 muestras dividida por la raíz del tamaño de la muestra
