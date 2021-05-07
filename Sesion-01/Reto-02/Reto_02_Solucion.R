# Reto 2

amazon.best <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/bestsellers%20with%20categories.csv")

# Convirtiendo el DF a transpuesto y en un data frame 
tAmazon <- as.data.frame(t(amazon.best))

# Usando el nombre de los libros como el nombre de las columnas
colnames(tAmazon) <- tAmazon[1,]

row.names(tAmazon)

# libro con mayor precio
which.max(tAmazon["Price",])

# libro con menor precio
which.min(tAmazon["Price",])
