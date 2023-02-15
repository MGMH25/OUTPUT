#Objetivo: estimar el Maxium Spanning Tree- árbol de expansión máxima -- asegurar visión clara del espacio-producto#
#ejecutar librería#
library(EconGeo)
#ubicar el archivo#
file.choose()
#cargar la base de datos. Pegar la ruta del archivo ya ubicado#
M=as.matrix(
  read.csv("/Users/lu/Downloads/relatednessbinario.csv",
           sep=",",
           header=T,
           row.names = 1))
#visualizar una parte de la matriz cargada(primeros 10 datos)
head (M[,1:10])
#obtener el orden de la matriz:renglones x columnas#
dim(M)
#Ejecutar librería igraph#
library(igraph)
#graficar la matriz de proximidades natural#
red_hidalgo1 <- graph.adjacency(M, mode="undirected" , weighted = TRUE)
#visualizar el gráfico red_hidalgo1 generado#
plot(red_hidalgo1)
#Transformar la matriz en NEGATIVA para identificar los máximos#
M <- -M
#visualizar la matriz con el árbol de expansión máxima (los primeros 6 datos)#
head(M[,1:6])
#generar el nuevo gráfico con la matriz negativa para ver el espacio-producto tecnológico#
red_hidalgo2 <-graph.adjacency(M, mode = "undirected" , weighted = TRUE)
#calcular el árbol de expansión mínima del gráfico red_hidalgo2#
MST<- minimum.spanning.tree(red_hidalgo2)
#visualizar el gráfico red_hidalgo2 generado#
plot(MST, vertex.shape="none", vertex.label.cex=.7)
#generar la nueva matriz de adyacencias A#
A <- get.adjacency(MST, sparse =F)
#Exportar gráfico para una paquetería especializada#
write.graph(MST,file="redhidalgo2.gml",format="gml")
#exportar red de adyacencias#
write.csv(A,file="AdyacentesconMST,csv")
