
## practica 2: objetos

x <- c(1, 2, 3); y <- c("a", "b", "c")
z <- c(TRUE, TRUE, FALSE)

## matrices

xx <- matrix(c(x,y,z), nrow=3, ncol=3)
xx

## ejemplo multiplicacion matrices.

A = matrix(c(2,3,4,5), nrow=2, ncol=2)

B = matrix(c(3,3), nrow=2, ncol=1)

A %*% B
A
t(A) ## transpuesta de la matrix
solve(A) ## inversa de la matrix
eigen(A) ## valores y vectores propios
dim(A) ## dimension de una matriz

### vector cualitativo.

x <- factor(c(1, 2, 2, 1, 1, 2, 1, 2, 1))
mean(x) ## no es posible dado que es cualitativa.
table(x) ## permite contar cuantas veces sale una categoria

### listas

una.lista <- list(un.vector = 1:10,
                  una.palabra = "hola",
                  una.matriz = matrix(rnorm(20), ncol = 5),
                  lista2 = c(a = 5, b = factor(c("a", "b"))))

una.lista[1] ## llama el primer objeto de la lista
una.lista[[1]] ## llama el primer objeto de la lista
una.lista[[1]][5] ## llamamos el primer objeto de la lista
## y luego el que aparece en la posición 5.

una.lista$una.matriz[,2]
## llama el objeto "una.matriz" y luego la segunda columna.

### funcion str(): sirve para ver el tipo de objeto.

str(una.lista)

str(x)

### funcion length(): sirve para ver la longitud de objeto.

length(una.lista)
length(x)

### ejemplo cambiar la naturaleza de x.

x.recod = as.numeric(x)
mean(x.recod)
is.numeric(x.recod) ## consulta si es numerico.


### funciones rbind() y cbind()
### unir matrices A y B

C = rbind(A, t(B))
C

D = cbind(A, B)
D

###  Creación de vectores con secuencias. Ejemplos:
xx <- seq(0,1,0.2); xx
rr <- 1:10; rr
sec1 <- seq(0,100,10); sec1

sec2 <- as.character(sec1) ; sec2
## Cambio de numérico a carácter.

### Otro ejemplo:

sec4 <- c(1, 5, 7); sec4
is.numeric(sec4)

sec5 <- as.character(sec4); sec5
is.character(sec5)

### funcion paste()

y <- c("Bogotá", "Cali", "Medellín", "Cartagena", "Barranquilla") 
w <- c("Muy malo", "Malo", "Regular", "Bueno", "Muy bueno"); w
paste(y, w, sep=" - ")


### ejercicio 1.

Edad<- c(25, 30, 22, 26, 32, 25, 21,
         29, 34, 37, 30, 28, 41, 22)
Nombres <- c("Pedro", "James", "Miguel", "Daniel", "Jose", 
  "Diana", "Sandra", "Adriana", "Alexis", "Claudia",
  "Ana", "Andrea", "Jorge", "Carlos")

### 3 punto.
Nombres[Edad<25]; Edad[Edad<25]


datos = data.frame(Edad)

row.names(datos) = Nombres

datos$Edad[Edad<25]

## punto 4
paste(Nombres, " tiene", Edad, " años")









