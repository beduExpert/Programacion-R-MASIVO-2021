#### Técnicas descriptivas: gráficas, tendencias y variación estacional

# Datos de pasajeros aéreos (en miles) de una aerolínea

AP <- AirPassengers
AP

# Clase de un objeto

class(AP)

start(AP); end(AP); frequency(AP)

summary(AP)

plot(AP, ylab = "Pasajeros (1000's)", xlab = "Tiempo", 
     main = "Reserva de pasajeros aéreos internacionales", 
     sub = "Estados Unidos en el periodo 1949-1960")

################################################

# https://github.com/AtefOuni/ts/tree/master/Data

# Series de Tiempo Múltiple

# Serie de producción de electricidad, cerveza y chocolate

# Establecer el directorio de trabajo según corresponda

# setwd()

CBE <- read.csv("cbe.csv", header = TRUE)
CBE[1:4,]
class(CBE)

Elec.ts <- ts(CBE[, 3], start = 1958, freq = 12)
Beer.ts <- ts(CBE[, 2], start = 1958, freq = 12)
Choc.ts <- ts(CBE[, 1], start = 1958, freq = 12)

plot(cbind(Elec.ts, Beer.ts, Choc.ts), 
     main = "Producción de Chocolate, Cerveza y Electricidad", 
     xlab = "Tiempo",
     sub = "Enero de 1958 - Diciembre de 1990")

################################################

# Serie de temperaturas globales, expresadas como anomalías de las medias mensuales

Global <- scan("global.txt")
Global.ts <- ts(Global, st = c(1856, 1), end = c(2005, 12), fr = 12)
Global.annual <- aggregate(Global.ts, FUN = mean)
plot(Global.ts, xlab = "Tiempo", ylab = "Temperatura en °C", main = "Serie de Temperatura Global",
     sub = "Serie mensual: Enero de 1856 a Diciembre de 2005")
plot(Global.annual, xlab = "Tiempo", ylab = "Temperatura en °C", main = "Serie de Temperatura Global",
     sub = "Serie anual de temperaturas medias: 1856 a 2005")

################################################

New.series <- window(Global.ts, start = c(1970, 1), end = c(2005, 12)) 
New.time <- time(New.series)
plot(New.series, xlab = "Tiempo", ylab = "Temperatura en °C", main = "Serie de Temperatura Global",
     sub = "Serie mensual: Enero de 1970 a Diciembre de 2005"); abline(reg = lm(New.series ~ New.time))


#### Descomposición de series

# Modelo Aditivo

# Se debe elegir entre el modelo aditivo o el modelo multiplicativo cuando sea razonable suponer la descomposición
Elec.decom.A <- decompose(Elec.ts)

plot(Elec.decom.A, xlab = "Tiempo", 
     sub = "Descomposición de los datos de producción de electricidad")

# Componentes

Tendencia <- Elec.decom.A$trend
Estacionalidad <- Elec.decom.A$seasonal
Aleatorio <- Elec.decom.A$random

plot(Elec.ts, 
     xlab = "Tiempo", main = "Datos de Producción de Electricidad", 
     ylab = "Producción de electricidad", lwd = 2,
     sub = "Tendencia con efectos estacionales aditivos sobrepuestos")
lines(Tendencia, lwd = 2, col = "blue")
lines(Tendencia + Estacionalidad, lwd = 2, col = "red", lty = 2)

ts.plot(cbind(Tendencia, Tendencia + Estacionalidad), 
        xlab = "Tiempo", main = "Datos de Producción de Electricidad", 
        ylab = "Producción de electricidad", lty = 1:2, 
        col = c("blue", "red"), lwd = 2,
        sub = "Tendencia con efectos estacionales aditivos sobrepuestos")

Tendencia[20] + Estacionalidad[20] + Aleatorio[20]
Elec.ts[20]

###

# Modelo Multiplicativo

Elec.decom.M <- decompose(Elec.ts, type = "mult")

plot(Elec.decom.M, xlab = "Tiempo", 
     sub = "Descomposición de los datos de producción de electricidad")

# Componentes

Trend <- Elec.decom.M$trend
Seasonal <- Elec.decom.M$seasonal
Random <- Elec.decom.M$random

plot(Elec.ts, 
     xlab = "Tiempo", main = "Datos de Producción de Electricidad", 
     ylab = "Producción de electricidad", lwd = 2,
     sub = "Tendencia con efectos estacionales multiplicativos sobrepuestos")
lines(Trend, lwd = 2, col = "blue")
lines(Trend * Seasonal, lwd = 2, col = "red", lty = 2)

ts.plot(cbind(Trend, Trend * Seasonal), 
        xlab = "Tiempo", main = "Datos de Producción de Electricidad", 
        ylab = "Producción de electricidad", lty = 1:2, 
        col = c("blue", "red"), lwd = 2,
        sub = "Tendencia con efectos estacionales multiplicativos sobrepuestos")

Trend[100]*Seasonal[100]*Random[100]
Elec.ts[100]


# J. Cryer & K. Chan. (2008). Time Series Analysis With Applications 
# in R. 233 Spring Street, New York, NY 10013, USA: Springer 
# Science+Business Media, LLC.

# P. Cowpertwait & A. Metcalfe. (2009). Introductory Time Series with R. 
# 233 Spring Street, New York, NY 10013, USA: Springer Science+Business 
# Media, LLC.
