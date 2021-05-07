# Reto 3

# 1. Importa los datos de producción de electricidad que se encuentra en el archivo cbe.csv a R
# 2. Crea la serie de tiempo mensual de producción de electricidad en R a partir del año 1958
# 3. Realiza la descomposición multiplicativa de la serie de tiempo y grafica la serie original junto con sus componentes (tendencia, estacionalidad y componente aleatoria)
# 4. Realiza la gráfica de tendencia y coloca la gráfica de tendencia*estacionalidad superpuesta a esta

# **Solución**

CBE <- read.csv("cbe.csv")
Elec.ts <- ts(CBE[, 3], start = 1958, freq = 12)

# Modelo Multiplicativo

Elec.decom.M <- decompose(Elec.ts, type = "mult")

plot(Elec.decom.M, xlab = "Tiempo", 
     sub = "Descomposición de los datos de producción de electricidad")

# Componentes

Trend <- Elec.decom.M$trend
Seasonal <- Elec.decom.M$seasonal
Random <- Elec.decom.M$random

ts.plot(cbind(Trend, Trend*Seasonal), xlab = "Tiempo", main = "Datos de Producción de Electricidad", 
        ylab = "Producción de electricidad", lty = 1:2,
        sub = "Tendencia con efectos estacionales multiplicativos sobrepuestos")

Trend[7]*Seasonal[7]*Random[7]
Elec.ts[7]

Trend[100]*Seasonal[100]*Random[100]
Elec.ts[100]
