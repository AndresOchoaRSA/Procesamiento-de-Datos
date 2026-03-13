
### ggplot2 practica
### datos arboles

library(ggplot2)

censo.arboreo.comuna.22 <- read.csv2("C:/Users/Andres/Desktop/practica 2R/censo-arboreo-comuna-22.csv", 
                                     stringsAsFactors=TRUE)

summary(censo.arboreo.comuna.22)

### histograma

ggplot(censo.arboreo.comuna.22, aes(x=altura_arbol))+
  geom_histogram(fill="gold")+
  labs(x="altura (m)", y="conteo")+
  theme_bw()

### boxplot

ggplot(censo.arboreo.comuna.22, aes(x=altura_arbol))+
  geom_boxplot(fill="green")+
  labs(x="altura (m)", title="Diagrama de cajas altura")

### boxplot comparativo

ggplot(censo.arboreo.comuna.22,
       aes(y=altura_arbol, x=barrio, fill=barrio))+
  geom_boxplot()+
  labs(y="altura (m)", x="barrio")

### diagrama de dispersion

ggplot(censo.arboreo.comuna.22,
       aes(x=altura_arbol, y=diametro_copa))+
  geom_jitter()+
  geom_smooth(method=lm, colour="red")
  











