library(rvest)

theurl <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"

file<-read_html(theurl)

tables<-html_nodes(file, "table")
# Hay que analizar 'tables' para determinar cual es la posición en la lista que contiene la tabla, en este caso es la no. 4 

table1 <- html_table(tables[1], fill = TRUE)


table <- na.omit(as.data.frame(table1))

str(table)

#Removiendo caracteres inncesarios 
a <- gsub("MXN","",table$Sueldo)
a <- gsub("[^[:alnum:][:blank:]?]", "", a)
a <- gsub("mes", "", a)
a <- as.numeric(a)
table$Sueldo <- a

#Removiendo caracteres inncesarios
b <- gsub("Sueldos para Data Scientist en ", "", table$Cargo)
table$Cargo <-b

#Máximo sueldo
max.sueldo <- which.max(table$Sueldo)
table[max.sueldo,]

#Mínimo sueldo
min.sueldo <- which.min(table$Sueldo)
table[min.sueldo,]
