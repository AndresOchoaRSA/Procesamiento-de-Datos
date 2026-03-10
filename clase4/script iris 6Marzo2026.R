
data(iris)  ## se llama el conjunto de datos iris.

summary(iris) ## se realiza las estadísticas descriptivas.

sd(iris$Sepal.Length) ## se calcula la desviacion estandar de Sepal Length
sd(iris$Sepal.Width)
sd(iris$Petal.Length)
sd(iris$Petal.Width)

iris[1,]  ## llama los datos de la primer fila de iris.
iris[,1]  ## llama los datos de la primera columna de iris.
iris[2,3] ## llama el datos de la fila 2 y columna 3 de iris.
iris[,1:4] ## llama las columnas de la 1 a la 4 de iris.

### matriz de varianzas y covarianzas
cov(iris[,1:4])

### matriz de correlacion
cor(iris[,1:4])

### grafico de la correlacion
library(corrplot)
corrplot(cor(iris[,1:4]), method="number")

### histogramas

hist(iris$Sepal.Length, col = "green", main="Histograma de Sepal.Length",
     xlab="Sepal Length (cm)", ylab="Conteo")

hist(iris$Sepal.Width, col="red", main="Histograma de Sepal.Width",
     xlab="Sepal Length (cm)", ylab="Conteo")

hist(iris$Petal.Length, col="skyblue", main="Histograma de Petal.Length",
     xlab="Petal Length (cm)", ylab="Conteo")

hist(iris$Petal.Width, col="gold", main="Histograma de Petal Width",
     xlab="Petal Width (cm)", ylab="Conteo", sub="Univalle Marzo 2026")


par(mfrow=c(2,2))  ## divide la pantalla grafica en 2 filas y 2 columnas

hist(iris$Sepal.Length, col = "green", main="Histograma de Sepal.Length",
     xlab="Sepal Length (cm)", ylab="Conteo")

hist(iris$Sepal.Width, col="red", main="Histograma de Sepal.Width",
     xlab="Sepal Length (cm)", ylab="Conteo",xlim=c(2,4.5))

hist(iris$Petal.Length, col="skyblue", main="Histograma de Petal.Length",
     xlab="Petal Length (cm)", ylab="Conteo",ylim=c(0,50))

hist(iris$Petal.Width, col="gold", main="Histograma de Petal Width",
     xlab="Petal Width (cm)", ylab="Conteo", sub="Univalle Marzo 2026")


### diagramas de cajas.
par(mfrow=c(2,2))
boxplot(iris$Sepal.Length, col="green", main="Sepal.Length",
        ylab="Sepal.Length (cm)")
boxplot(iris$Sepal.Width, col="red", main="Sepal.Width",
        ylab="Sepal.Width (cm)")
boxplot(iris$Petal.Length, col="skyblue", main="Petal.Length",
        ylab="Petal.Length (cm)")
boxplot(iris$Petal.Width, col="gold", main="Petal.Width",
        ylab="Petal.Width (cm)")


### diagrama de cajas por grupo

par(mfrow=c(2,2))
boxplot(iris$Sepal.Length~iris$Species, col=c("green","pink","skyblue"),
        main="Sepal.Length",ylab="Sepal.Length (cm)", xlab="Species")
boxplot(iris$Sepal.Width~iris$Species, col=c("green","pink","skyblue"),
        main="Sepal.Width",ylab="Sepal.Width (cm)",xlab="Species")
boxplot(iris$Petal.Length~iris$Species, col=c("green","pink","skyblue"),
        main="Petal.Length",ylab="Petal.Length (cm)",xlab="Species")
boxplot(iris$Petal.Width~iris$Species, col=c("green","pink","skyblue"),
        main="Petal.Width", ylab="Petal.Width (cm)",xlab="Species")


### graficos de dispersion

plot(iris[,1:4], col=iris$Species)














