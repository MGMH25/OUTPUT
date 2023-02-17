#lab 16

#realizar un análisis de redes en R
#Red no dirigida 

library(EconGeo)

#Cartar data- Edge List (lista de aristas)
EL = read.csv("https://raw.githubusercontent.com/PABalland/ON/master/lesmis-el.csv")


#Ver encabezados del Edge List (EL)

head(EL)

#Transformar EL en matriz

MM<- get.matrix(EL)

#Visualizar los encabezados de la matriz

head(MM[,1:5])

#La red presenta las interacciones entre los personajes
#de Los Miserables 
#es una red no dirigida, tiene dirección bidireccional
#matriz simétrica con ceros en diagonal 

#llamar igpraph

library(igraph)

#graficar la EL creando un objeto g

g<-graph_from_data_frame(d=EL, directed = F)

#Visualizar el gráfico g generado 

plot(g)

#Quitar los pesos a la EL (visualizar interacciones sin ensanchar el nodo)

#para generar gráfico interactivo 

EL$Weight = NULL

#Visualizar encabezado de EL sin pesos
head(EL)

#Descargar libreria 
install.packages("networkD3")

#llamar libreria 
library(networkD3)

#Crear gráfico interactivo para identificar estructura de la red
#Visualización con estructura más adecuada a los datos

simpleNetwork(EL)

