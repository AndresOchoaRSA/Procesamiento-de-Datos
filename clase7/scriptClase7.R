
### clase7 - 22 Mayo 206
### funciones, if, for, while, apply.
### revisar Diapositivas 4 y 6.

CV= function(x){
  CV=sd(x)/mean(x)
  interpretacion = ifelse(CV<=0.2, "Los datos son homogéneos",
                          "Los datos son heterogéneos")
  ww = list(CV, interpretacion)
  return(ww)
}

data(iris)
CV(iris$Sepal.Length)

### function barplot2

barplot2<-function(px,title){
  xpx<-prop.table(table(px))*100
  xpx<-round(array(xpx),1)
  ypx<-as.character(xpx)
  xpx
  barplot2<-barplot(prop.table(table(px))*100,ylim=c(0,100),
                   main=title,sub="", xlab="",
                   ylab="Porcentaje %",
                   cex.sub=0.7,font.sub=3,
                   col=rainbow(5),
                   cex.main=0.9,cex.names=0.8)
  text(xpx+8,ypx,adj=c(0.5,0.5),cex=0.9)
}
barplot2(iris[,5],"Species")

## Ejemplo equipos de futbol.

EquipoFutbol = c(rep(Cali,2), rep(America,4),
                 rep(Millonarios,2), rep(Nacional,2),
                 rep(Otros,5))

barplot2(EquipoFutbol,"Diagrama de Barras equipos Futbol")


### ejemplos condicionales.

x <- 1.5
if(x >2 ){
  y <- 3*x; y}  else {
    y <- 0; y}


ifelse(x>2,3*x,0)  ## equivalente a lo anterior


corgraf <- function (x,y,graf) {
  if (graf==TRUE) {
    plot(x,y) } else {
      cor(x,y) 
    }
}
corgraf(runif(20),runif(20),TRUE)  ## Representa gráficamente los vectores
corgraf(runif(20),runif(20),FALSE)  ## solo se imprime el valor del coeficiente de correlación


### convertidor 

ConvertidorPD2 <- function(x,y){ ## Y== true dolares a pesos #colombianos
  if(y==TRUE) { 
    x1<- x*3682
    paste(x," Dolares son", x1," Pesos Colombianos") } else { 
      x2<- round(x/3682,4)
      paste(x," Pesos Colombianos son",x2," Dolares") }
}

#ConvertidorPD2(2000,FALSE)
ConvertidorPD2(3000,TRUE)


### ciclo for()

y <-c(3,3,3,5,5,5,8,8,8)
for(j in 1:length(y)){
  if (y[j]==5){
    y[j]="a"} else{
      y[j]="b"}
}
y 


### conjunto de datos X con 100 filas y 20 columnas


X = matrix(0, nrow=100, ncol=20)
ncol(X)

set.seed(100)  ## semilla.
for(j in 1:ncol(X)) {
  X[,j] = rnorm(100)
  promedio[j] = mean(X[,j])
  desviaciones[j] = sd(X[,j])
}

promedio
desviaciones


### histogramas y boxplots por columna

for(j in 1:ncol(X)){
  hist(X[,j], col=j,main=paste("Columna ",j))
  boxplot(X[,j], col=j, main=paste("Columna ", j))
}

### ciclo while

a <- 4
while (a < 5 ) {
  a <- a+1; print (a)
}


letras <- c("a", "b", "c", "d", "e", "f")
i <- 1
while (i <= 6) {
  print(letras[i])
  i <- i + 1
}


### Ir sumando los elementos de la primer columna de X
### hasta que la suma sea mayor de 3 y guarde la posición
### donde se cumple la condición.

suma <- 0
i <- 1

while(i <= nrow(X) && suma <= 3) {
  suma <- suma + X[i,1]
  
  if(suma > 3) {
    posicion <- i
  }
  i <- i + 1
}

suma
posicion


### ciclo repeat()

x <- 2; y<-0
repeat { 
  y <- (x^2)+1
  if(y>30) break
  print(y)
  x <- x+1 }


### funcion apply, sapply

### Ejemplo: calcular los coeficientes CV por columna de X.

apply(X, 2, CV)

### promedios por columna
apply(X,2, mean)
promedio

### desviaciones por columna
apply(X,2,sd)
desviaciones

### histogramas por columna
apply(X,2,hist)

### boxplot por columna
apply(X,2,boxplot)

### sapply y lapply

x <- list (a = rnorm(10), b = rnorm(100), c = rnorm(25)) ; x
sapply (x, mean)
lapply(x, mean)

sexo <- factor(c("mujer", "varon", "varon", "mujer", 
                 "mujer", "varon", "varon", "varon"))
altura <- c(1.60, 1.87, 1.70, 1.69, 1.58, 1.4, 1.80,1.79)
data <- data.frame(sexo,altura)
tapply(data$altura,data$sexo,mean)








































