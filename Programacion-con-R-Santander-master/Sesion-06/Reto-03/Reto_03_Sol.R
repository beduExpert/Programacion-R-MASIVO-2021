# Reto 3. Gráfica de series de tiempo

# Objetivo

# Utilizar las funciones `ts` y `ts.plot` para crear series de tiempo en `R`.

# Requisitos

# Tener instalado R y RStudio
# Haber trabajado con el Prework y el Work

# Desarrollo

# Con el conjunto de datos soccer.csv realiza lo siguiente

# 1. Crea un data frame para el Barcelona que indique el número de goles
# anotados en cada fecha que ha jugado.

# 2. Obtén un data frame que indique el promedio de goles anotados en cada
# mes que ha jugado

# 3. Crea una serie de tiempo mensual para el número promedio de goles 
# anotados por el Barcelona

# 4. Realiza los pasos 1 a 3 para el Real Madrid

# 5. Muestra en una misma imagen las gráficas de las series de tiempo
# anteriores

# **Solución**

data <- read.csv("soccer.csv")
data <- mutate(data, date = as.Date(date, "%Y-%m-%d"))

# Anotaciones y fechas como local

d1 <- data %>% select(date, home.team, home.score) %>% 
  filter(home.team == "Barcelona") %>% 
  rename(team = home.team, score = home.score)

# Anotaciones y fechas como visitante

d2 <- data %>% select(date, away.team, away.score) %>% 
  filter(away.team == "Barcelona") %>% 
  rename(team = away.team, score = away.score)

# data frame de anotaciones y fechas

d <- rbind(d1, d2) 

# data frame de promedio de anotaciones en cada mes

d <- mutate(d, Ym = format(date, "%Y-%m"))
barca <- d %>% group_by(Ym) %>% summarise(goles = mean(score))

# Creación de la serie de tiempo 

# A partir de agosto 2017

(barca <- ts(barca$goles, start = c(1, 1), end = c(3, 5), # Hasta diciembre de 2019
            frequency = 10))

######

# Anotaciones y fechas como local

d1 <- data %>% select(date, home.team, home.score) %>% 
  filter(home.team == "Real Madrid") %>% 
  rename(team = home.team, score = home.score)

# Anotaciones y fechas como visitante

d2 <- data %>% select(date, away.team, away.score) %>% 
  filter(away.team == "Real Madrid") %>% 
  rename(team = away.team, score = away.score)

# data frame de anotaciones y fechas

d <- rbind(d1, d2)

# data frame de promedio de anotaciones en cada mes

d <- mutate(d, Ym = format(date, "%Y-%m"))
realM <- d %>% group_by(Ym) %>% summarise(goles = mean(score))

# Creación de la serie de tiempo 

(realM <- ts(realM$goles, start = c(1, 1), # A partir de agosto 2017
            frequency = 10, end = c(3, 5))) # Hasta diciembre de 2019

######

# Gráficas de series de tiempo

ts.plot(cbind(barca, realM), col = c(2, 4), ylim = c(0, 5))
abline(h = mean(barca), lwd = 2, col = 2, lty = 2)
abline(h = mean(realM), lwd = 2, col = 4, lty = 2)
legend(x = 2, y = 5,
       legend = c("Barcelona", "Real Madrid"),
       col = c(2, 4), lty = c(1, 1))


