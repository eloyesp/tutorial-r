# Tutorial de R muy básico utilizando Rstudio
# Autor: Eloy Espinaco

# Vamos primero con algunas cuestiones del lenguaje
# esto es un comentario
2+2 # Si venís a esta linea y apretás ctrl + enter. Esta linea se ejecuta en la
# consola y podés probar las operaciones propuestas
x <- 4 # se pueden utilizar variables.
x <- x + 2 # y sus valores pueden cambiar.
rm(x) # las variables pueden borrarse

# Ahora vamos a crear una colección (que nos va a servir para sacar promedios,
# mediana, etc.)
lista_linda <- c(1, 2, 3, 3, 5)
lista_fea <- c(10.4, 5.6, 3.1, 6.4, 21.7)

# calculamos la media
mean(lista_fea) # media de la lista fea
mean(lista_linda)

# 
median(x=lista_fea)

table(lista_linda)

cut(lista_linda,breaks=3)