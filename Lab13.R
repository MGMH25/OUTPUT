####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por MGMH (UAEH)


# LABORATORIO - Gráficos en R con ggplot2 

install.packages("ggplot2")
# cargar libreria ggplot2
library(ggplot2)

# leer df
green_data <- read.csv("REGESIONES FINALES.csv")


# echando un ojo a los datos
names(green_data)


# Graficar la relación existente entre los indicadores pareados (g1)
p1 <- ggplot (data = green_data, 
              mapping =aes (x = ICE_index,
                            y= GCI_index,)) +
  geom_point()+
  geom_text(label = green_data$STATE,
            color= "black",
            size =4) +
  geom_point()+
  geom_smooth(method=lm,
              se=FALSE,
              fullrange=T)
#visualizar el gráfico 1
p1

#Dibujar otro gráfico, de rankings

p2 <- ggplot (data = green_data, 
              mapping =aes (x = ICE_rank,
                            y= GCI_rank,)) +
  geom_point()+
  geom_text(label = green_data$STATE,
            color= "black",
            size =4) +
  geom_point()+
  geom_smooth(method=lm,
              se=FALSE,
              fullrange=T)

#Visualizar gráfico 2 
p2 

#Se observa una relación lineal entre variables, pero no se conoce
#correlación lineal exacta entre ICE_rank y GCI_rank

#Dibujar gráfico 3 con LPIBE (PIB estatal) y GCI_index

p3 <- ggplot (data = green_data, 
              mapping =aes (x = LPIBE,
                            y= GCI_index,)) +
  geom_point()+
  geom_text(label = green_data$STATE,
            color= "black",
            size =4) +
  geom_point()+
  geom_smooth(method=lm,
              se=FALSE,
              fullrange=T)

#Visualizar gráfico 3

p3 

#instalar librería

install.packages("psych")

#llamar a librería 
library(psych)

#instalar librería 

install.packages("readr")

#llamar a librería 
library(readr)

#Abrir el dara frame correl 

correl <- read_csv("correl.csv")

#Visualizar la tabla (primeros datos)
head(correl)

#correlacionar las variables de forma pareada

attach(correl)

#Visualizar nombres de variables 
names(correl)

#generar gráficos de disperción 
pairs(correl)

#ver los gráficos en un panel (con distribución de las varibles )

pairs.panels(correl)

#calcular la correlación generando un dataframe llamado complex_corr

complex_corr <- cor(correl, method = "pearson")

#visualizar el data frame 

complex_corr

#Redondear el coeficiente de correlción 
complex_corr = round(complex_corr, digits=2)

#visualizar el coeficiente de correlación redondeado

complex_corr

#instalar paquetería  
install.packages("ggcorrplot")

#llamar a librería 
library(ggcorrplot)
library(ggcorrplot)


#generar mapa de calor de las correlaciones 

p4 <- ggcorrplot(complex_corr,method = "circle", type = "lower", lab= TRUE) +
  ggtitle("Matriz de correlación") +
  theme_minimal()

#visualizar mapa de calor 
p4

#Entre más rojo= correlación lineal apreciable 
#Entre más azul = correlación inversa apreciable


#Instalar librería 
install.packages("ggpubr")

#ejecutar librería 
require(ggpubr)

#generar un conjutno de gráficos de una sola cuadrícula 
#unir p1, p2 p3 y p4

ggpubr :: ggarrange (p1, p2, p3, p4, etiquetas = c ("A", "B", "C" , "D"))


#instalar librería 

install.packages("gridExtra")

#ejecutar librería 


library(ggplot2)
require (gridExtra)

#crear un nuevo gráfico F1 (cuadrícula cuadrada)

F1 <- grid.arrange(p1,p2,p3,p4, nrow=2)
