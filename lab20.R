####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Carla Carolina Pérez Hernández (UAEH)
#Ejecutado por María Guadalupe Montiel Hernández


# LABORATORIO - Gráficos en R con ggplot2 
# faceting (romper un gráfica en varias dentro de una cuadrícula)



#instalando paquete 
install.packages("ggplot2")



# cargar libreria ggplot2 
library(ggplot2)


#buscar df
file.choose()

# leer base
densidad_verde <- read.csv("/Users/lu/Downloads/drive-download-20230220T172924Z-001/PARA FACETING.csv")

#ver nombres
names(densidad_verde)

# colocando grafica base
#1. x= densidad del relacionamiento verde
#2. y= Índice de complejidad del producto
p<-ggplot(data = densidad_verde,
          mapping = aes (x=DENSITY,
                      y = PCI.2018,
                      color= Region))+
  geom_point()


# visualizar objeto p
p

# facet_wrap (recomendado con una variable)
p+facet_wrap(~ Region)



# Hacer faceting manipulando número de filas

p+facet_wrap(~ Region, nrow=3)

# hacer faceting manipulando número de columnas

p+facet_wrap(~ Region, ncol=5)
