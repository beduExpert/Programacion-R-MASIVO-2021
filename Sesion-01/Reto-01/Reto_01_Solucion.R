# Reto 1

# leyendo el fichero desde el repositorio

netflix <-read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")

# dimensión del data frame
dim(netflix)
class(netflix)

# titulos que se estrenaron despues del 2015 

net.2015 <- netflix[netflix$release_year > 2015, ]

# escritura del archivo
write.csv(net.2015, "res.netflix.csv")
