# Ejemplo 3. Paquete dplyr y aplicaciones

#### Objetivo

- Utilizar funciones del paquete `dplyr` para seleccionar columnas, filtrar filas y en general manipular o transformar datos en un data frame y llevarlos a una forma deseada

#### Requisitos

- Conocer y saber usar funciones como `str` y `head` para obtener un mejor conocimiento de los datos contenidos en un data frame de una manera fácil y rápida

#### Desarrollo

El paquete `dplyr` cuenta con varias funciones muy útiles para manipular y transformar data frames. Una vez instalado el paquete `dplyr`, puede cargarlo en `R` de la siguiente manera (sin mensajes ni advertencias)

```R
suppressMessages(suppressWarnings(library(dplyr)))
```

Vamos a descargar archivos csv que contienen datos del covid-19 para mostrar como funcionan algunas funciones del paquete `dplyr`. Las url desde las cuales descargamos los datos son las siguientes

```R
url1 <- "https://data.humdata.org/hxlproxy/data/download/time_series_covid19_confirmed_global_narrow.csv?dest=data_edit&filter01=explode&explode-header-att01=date&explode-value-att01=value&filter02=rename&rename-oldtag02=%23affected%2Bdate&rename-newtag02=%23date&rename-header02=Date&filter03=rename&rename-oldtag03=%23affected%2Bvalue&rename-newtag03=%23affected%2Binfected%2Bvalue%2Bnum&rename-header03=Value&filter04=clean&clean-date-tags04=%23date&filter05=sort&sort-tags05=%23date&sort-reverse05=on&filter06=sort&sort-tags06=%23country%2Bname%2C%23adm1%2Bname&tagger-match-all=on&tagger-default-tag=%23affected%2Blabel&tagger-01-header=province%2Fstate&tagger-01-tag=%23adm1%2Bname&tagger-02-header=country%2Fregion&tagger-02-tag=%23country%2Bname&tagger-03-header=lat&tagger-03-tag=%23geo%2Blat&tagger-04-header=long&tagger-04-tag=%23geo%2Blon&header-row=1&url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_confirmed_global.csv"
url2 <- "https://data.humdata.org/hxlproxy/data/download/time_series_covid19_deaths_global_narrow.csv?dest=data_edit&filter01=explode&explode-header-att01=date&explode-value-att01=value&filter02=rename&rename-oldtag02=%23affected%2Bdate&rename-newtag02=%23date&rename-header02=Date&filter03=rename&rename-oldtag03=%23affected%2Bvalue&rename-newtag03=%23affected%2Binfected%2Bvalue%2Bnum&rename-header03=Value&filter04=clean&clean-date-tags04=%23date&filter05=sort&sort-tags05=%23date&sort-reverse05=on&filter06=sort&sort-tags06=%23country%2Bname%2C%23adm1%2Bname&tagger-match-all=on&tagger-default-tag=%23affected%2Blabel&tagger-01-header=province%2Fstate&tagger-01-tag=%23adm1%2Bname&tagger-02-header=country%2Fregion&tagger-02-tag=%23country%2Bname&tagger-03-header=lat&tagger-03-tag=%23geo%2Blat&tagger-04-header=long&tagger-04-tag=%23geo%2Blon&header-row=1&url=https%3A%2F%2Fraw.githubusercontent.com%2FCSSEGISandData%2FCOVID-19%2Fmaster%2Fcsse_covid_19_data%2Fcsse_covid_19_time_series%2Ftime_series_covid19_deaths_global.csv"
```

Descargamos los datos en nuestro directorio de trabajo con la siguiente instrucción

```R
download.file(url = url1, destfile = "st19ncov-confirmados.csv", mode = "wb")
download.file(url = url2, destfile = "st19ncov-muertes.csv", mode = "wb")
```

Una vez que hemos descargado los datos, importamos a `R` los datos de casos confirmados y muertes por covid-19

```R
conf <- read.csv("st19ncov-confirmados.csv")
mu <- read.csv("st19ncov-muertes.csv")
```

Utilizamos las funciones `str` y `head` para ver algunas características

```R
str(conf); str(mu)
head(conf); head(mu)
```

Ahora seleccionamos todas las filas excepto la primera, esto para cada data frame

```R
Sconf <- conf[-1, ]
Smu <- mu[-1, ]
```

Con la función `select` del paquete `dplyr`, del data frame de casos confirmados seleccionamos únicamente las columnas de país, fecha y número acumulado de casos

```R
Sconf <- select(Sconf, Country.Region, Date, Value) # País, fecha y acumulado de infectados
```

Con la función `rename`, renombramos las columnas correspondientes al país y al número acumulado de infectados por covid-19

```R
Sconf <- rename(Sconf, Pais = Country.Region, Fecha = Date, Infectados = Value)
```

```R
str(Sconf)
```

Como cada una de las columnas del último data frame aparecen como factor, con la función `mutate` transformamos las columnas correspondientes a fechas y a número de infectados, esto para que `R` reconozca como fechas la columna correspondiente y como números los elementos de la columna que indica el acumulado de casos.

```R
Sconf <- mutate(Sconf, Fecha = as.Date(Fecha, "%Y-%m-%d"), Infectados = as.numeric(Infectados)) 
```

Hacemos algo similar con el data frame correspondiente al número acumulado de muertos

```R
Smu <- select(Smu, Country.Region, Date, Value) # Seleccionamos país, fecha y acumulado de muertos
Smu <- rename(Smu, Pais = Country.Region, Fecha = Date, Muertos = Value) # Renombramos
Smu <- mutate(Smu, Fecha = as.Date(Fecha, "%Y-%m-%d"), Muertos = as.numeric(Muertos)) 
```

```R
Scm <- merge(Sconf, Smu) # Unimos infectados y muertos acumulados para cada fecha
```

```R
mex <- filter(Scm, Pais == "Mexico") # Seleccionamos sólo a México
mex <- filter(mex, Infectados != 0) # Primer día de infectados
```

Para México, creamos otras variables o columnas de interés con ayuda de la función `mutate` 

```R
mex <- mutate(mex, NI = c(1, diff(Infectados))) # Nuevos infectados por día
mex <- mutate(mex, NM = c(0, diff(Muertos))) # Nuevos muertos por día

mex <- mutate(mex, Letalidad = round(Muertos/Infectados*100, 1)) # Tasa de letalidad

mex <- mutate(mex, IDA = lag(Infectados), MDA = lag(Muertos)) # Valores día anterior
mex <- mutate(mex, FCI = Infectados/IDA, FCM = Muertos/MDA) # Factores de Crecimiento
mex <- mutate(mex, Dia = 1:dim(mex)[1]) # Días de contingencia
```

Finalmente, observamos algunas filas de nuestro último data frame

```R
head(mex); tail(mex)
write.csv(mex, "C19Mexico.csv", row.names = FALSE)
```

#### *Nota: en el ejemplo 5 de la sesión 3 se hará uso del archivo creado `C19Mexico.csv`*
