# RETO 2. Estadísticos de la NBA

Full players stats from the 2014-2015 season + personal details such as height. weight, etc.

#### Objetivo
- Generar histogramas
- Generar gráficos de dispersión
- Identificar datos relevantes 
- Hacer Boxplots

#### Requisitos
- Manejo de data frames
- Graficas básicas

#### Desarrollo

1. Generar un histograma de los minuntos totales (`MIN`), de los jugadores y agregar una línea donde se muestre la media (Hint: para agregar la línea que muestre la media consulta la documentación sobre `geom_vline` y el argumento `xintercept`)

2. Generar un histograma de edad (`Age`) y agregar una línea con la media

3. Hacer un scatterplot de las variables `Weight` y  `Height` y observar la correlacón que existe entre ambas variables (1 sola gráfica)

4. Utiliza la función `which.max` para saber quién es el jugador más alto, una vez hecho esto, presenta los resultados en una leyenda que diga "El jugador más alto es: `Name`, con una altura de: `Height`". Las unidades de altura deben ser en metros.

5. Utiliza la función `which.min` para saber quién es el jugador más bajito, una vez hecho esto, presenta los resultados en una leyenda que diga "El jugador más bajito es: `Name`, con una altura de: `Height`". Las unidades de altura deben ser en metros.

6. ¿Cuál es la altura promedio?, representa el resultado en una frase que diga: "La altura promedio es: ALTURA"

7. Generar un scatterplot donde se representen las Asistencias totales (`AST.TOV`) vs Puntos (`PTS`), además has un face wrap con la posición (`Pos`). 
