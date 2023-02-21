# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)
# Ejecutado por MAría Guadalupe Montiel Hernández

##########################################################################################
# LABORATORIO 11: Visión clara del espacio-producto: CASO REAL_exportaciones hidalguenses #
#########################################################################################

# Objetivo: Estimar el Maximum Spanning Tree -Árbol de expansión máxima- (asegurar una visión clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder ver redes complejas

# Regla 1: mantener n-1 conexiones como máximo
# Regla 2: Quitar las conexiones con el peso más bajo, nos vamos quedar con las del peso máximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------


# 1.Cómo crear una Visión clara del espacio-producto: árbol de expansión máxima (MST) 
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

#cargar paquete
library(EconGeo)

#ubicar archivps
file.choose()

# ubicar archivo
file.choose()

#cargar base de datos
M = as.matrix(
  read.csv("/Users/lu/Downloads/relatednessbinario.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
#visualizar una parte de la matriz (primeros 10 datos)
head (M[,1:10])

#obtener orden de matriz: RxC
dim (M)
#ejecutar librería
library (igraph)
#graficar matriz de proximidades natural
red_hidalgo1<-graph.adjacency(M,mode="undirected" , weighted=TRUE)

#visualizar gráfico
plot(red_hidalgo1)
#transformar matriz en NEGATIVA para identificar los máximos
M<- -M
#Visualizar la matruz con el árbol de expansión máxima
head(M[,1:6])
#generar el nuevo gráfico con matriz negativa para ver el espacio-producto
red_hidalgo2 <- graph.adjacency(M,mode="undirected",weighted=TRUE)
#calcular el árbol de expansión mínima 
MST <- minimum.spanning.tree(red_hidalgo2)
#visualizar el gráfico red:hidalgo2 
plot(MST,vertex.shape="none",vertex.label.cex=.7)
#exportar gráfico para una paquetería especializada
write.graph(MST,file="redhidalgo2.gml",format="gml")
#generar la nueva matriz de adyacencias A
A<-get.adjacency(MST,sparse=F)
#exportar red de adyacencias
write.csv(A,file="AdyacentesConMST.csv")
