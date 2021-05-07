# NAB. Reto 2


# Full players stats from the 2014-2015 season + personal details such as height. weight, etc.

#The data was scraped and copied from:
 # http://www.basketball-reference.com/teams/
#  and
#http://stats.nba.com/leaders#!?Season=2014-15&SeasonType=Regular%20Season&StatCategory=MIN&CF=MING2&PerMode=Totals
# En esta última página podrás encontrar el glosario 


# Leyendo los datos de la NBa, 
nba <- read.csv("players_stats.csv")
names(nba)

# 1. Histograma de los minuntos totales de losjugadores y la media
mnba <-mean(nba$MIN)
ggplot(nba, aes(MIN))+ 
  geom_histogram(binwidth = 30, col="black", fill = "blue") + 
  ggtitle("Histograma de Minutos por jugador", paste("Media=",mnba)) +
  ylab("Frecuencia") +
  xlab("Minutos") +
  geom_vline(xintercept =  mnba, col = "red", lwd = 1.5, lty =2)+
  theme_light()

# 2. Histograma de edad y media

ma.nba <-mean(na.omit(nba$Age))

ggplot(nba, aes(Age))+ 
  geom_histogram(binwidth = 2, col="black", fill = "blue") + 
  ggtitle("Histograma de Edad", paste("Media=",ma.nba)) +
  ylab("Frecuencia") +
  xlab("Edad") +
  geom_vline(xintercept =  ma.nba, col = "red", lwd = 1.5, lty =2)+
  theme_light()

#3. Scatterplot de Peso y Altura

p <- nba %>% ggplot(aes(Weight, Height)) +
       geom_point()
p

(lmnba <- coef(lm(Height ~ Weight, data = nba)))
#> (Intercept)          MIN 
#>   -136.129102   1.193261 
p + geom_abline(intercept = lmnba[1], slope = lmnba[2], col = "red", lwd = 1.5, lty = 2)

#4. Jugador más alto
(alto <- which.max(nba$Height))
paste("El jugador más alto es:", nba$Name[alto],"con una altura de:" , round(nba$Height[alto]/100,2), "m")

#5. Jugador más bajo
(bajito <- which.min(nba$Height))
paste("El jugador más bajito es:", nba$Name[bajito],"con una altura de:" ,round(nba$Height[bajito]/100,2), "m")

#6. La altura promedio, (Hint: hay que utilizar na.omit en caso de presencia de NA´s)
(altura.m <- mean(na.omit(nba$Height)))
paste("La altura promedio es:", round(altura.m/100,2),"m")

# 7. Scatterplot de Asistencias totales vs Puntos, con un face wrap por posición.
nba %>% ggplot( aes(AST.TOV, PTS )) +
  geom_point() + 
  facet_wrap("Pos")
             
