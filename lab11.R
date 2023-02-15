file.choose()
M = as.matrix(
  read.csv("/Users/lu/Downloads/relatednessbinario.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))
head (M[,1:10])
dim (M)
library (igraph)
red_hidalgo1<-graph.adjacency(M,mode="undirected" , weighted=TRUE)
plot(red_hidalgo1)
M<- -M
head(M[,1:6])
red_hidalgo2 <- graph.adjacency(M,mode="undirected",weighted=TRUE)
MST <- minimum.spanning.tree(red_hidalgo2)
plot(MST,vertex.shape="none",vertex.label.cex=.7)
write.graph(MST,file="redhidalgo2.gml",format="gml")
A<-get.adjacency(MST,sparse=F)
write.csv(A,file="AdyacentesConMST.csv")
