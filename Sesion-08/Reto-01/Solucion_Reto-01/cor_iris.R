
library(dplyr)
library(tidyr)
library(reshape)

iris <- iris[,-5]
attach(iris)
mc.iris <- cor(iris) 

mc.irism <- melt(mc.iris)

# Gráfico de correlaciones
mc.irism %>% ggplot(aes(X1, X2)) + 
  geom_tile(aes(fill = value)) + 
  scale_fill_gradient(low = 'green', high = 'red') + 
  theme(axis.text.x = element_text(angle = 90, hjust = 0))
