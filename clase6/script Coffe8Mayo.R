
## configuración de las librerias
library(ggplot2) ## graficos avanzados
library(dplyr) ## filtros
library(corrplot) ## correlacion

## cargar los datos

Coffe = read.table("coffeData.csv", sep=";",
                   dec=".", stringsAsFactors = TRUE,
                   encoding = "latin1",
                   header=TRUE)

### estadisticas descriptivas

summary(Coffe[,-1])

### desviaciones estandar

sd(Coffe$Fragrance...Aroma)
sd(Coffe$Flavor)

### matriz de varianzas y covarianzas

Sigma = cov(Coffe[,4:14])

sqrt(diag(Sigma)) ## desviaciones de cada variable num.

## usando apply

ww = Coffe[,4:14]
apply(ww, 2, sd)

### matriz de correlación.

cor(ww)
corrplot(cor(ww), method="number")

corrplot(cor(ww), method="ellipse", tl.cex=0.6)
## tl.cex: modifica el tamaño del texto en variables.

### Histogramas.

g1 = ggplot(Coffe, aes(x=Fragrance...Aroma))+
  geom_histogram(fill="skyblue")+
  labs(title="Histograma para Aroma", x="Aroma")

g2 = ggplot(Coffe, aes(x=Flavor))+
  geom_histogram(fill="green")+
  labs(title="Histograma para Flavor",x="Flavor")

g3 = ggplot(Coffe, aes(x=Aftertaste))+
  geom_histogram(fill="red")+
  labs(title="Histograma para Afterstaste", x="Aftertaste")

g4 = ggplot(Coffe, aes(x=Salt...Acid))+
  geom_histogram(aes(y = after_stat(density)),fill="gold")+
  labs(title="Histograma para Salt", x="Salt")+
  geom_density(kernel = "gaussian")


library(gridExtra)  ## para juntar varios graficos
## panel grafico.

grid.arrange(g1,g2,g3,g4)


### Diagramas de Cajas y Panel Grafico.


w1 = ggplot(Coffe, aes(x=Fragrance...Aroma))+
  geom_boxplot(fill="skyblue")+
  labs(title="Boxplot para Aroma", x="Aroma")

w2 = ggplot(Coffe, aes(x=Flavor))+
  geom_boxplot(fill="green")+
  labs(title="Boxplot para Flavor",x="Flavor")

w3 = ggplot(Coffe, aes(x=Aftertaste))+
  geom_boxplot(fill="red")+
  labs(title="Boxplot para Afterstaste", x="Aftertaste")

w4 = ggplot(Coffe, aes(x=Salt...Acid))+
  geom_boxplot(fill="gold")+
  labs(title="Boxplot para Salt", x="Salt")

grid.arrange(w1,w2,w3,w4)


### Diagrama de Dispersión entre el Sabor y la Calidad.

ggplot(Coffe, aes(x=Flavor, y=quality_score))+
  geom_jitter(colour="blue")+
  geom_smooth(method = "lm", colour="red")+
  labs(title="Diagrama de Dispersión para Flavor y Quality",
       y="Quality")+
  theme_bw()

### Paises con mejor calidad del cafe en sur america.

SurAmerica = filter(Coffe, 
Country.of.Origin  %in% c("Colombia","Brazil", "Peru","Ecuador"))

## grafico de cajas
# los graficos clasicos no funcionan bien con dplyr.
#boxplot(SurAmerica$quality_score ~ SurAmerica$Country.of.Origin)

ggplot(SurAmerica, 
aes(y=quality_score,x=Country.of.Origin, fill=Country.of.Origin))+
  geom_boxplot()+
  labs(title="Calidad del Café en Sur America",
       x="País", y="Calidad", fill="País")+
  scale_fill_brewer(palette="Reds")
  #scale_fill_brewer(palette="Greens")
  #scale_fill_brewer(palette="Blues")
  #scale_fill_brewer(palette="BuPu")


### Calidad del Café en Paises de Africa.

Africa = filter(Coffe, 
Country.of.Origin  %in% c("Uganda","Ethiopia", "Zambia","Kenya","Tanzania, United Republic Of","Burundi"))


ggplot(Africa, 
       aes(y=quality_score,x=Country.of.Origin, fill=Country.of.Origin))+
  geom_boxplot()+
  labs(title="Calidad del Café en Africa",
       x="País", y="Calidad", fill="País")+
  scale_fill_brewer(palette="Reds")
#scale_fill_brewer(palette="Greens")
#scale_fill_brewer(palette="Blues")
#scale_fill_brewer(palette="BuPu")































