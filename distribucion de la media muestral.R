# Copyright Eloy Espinaco (2012)

# Genero (N = 1000) muestras aleatorias de tamaño n = 3 de la distribucion
# normal estandar y obtengo sus media y desviación estandar. Ploteo la grafica
# resultante mediante curve.

ns <- sort(c(300, 5, 30, 50, 100), decreasing=T)
cols <- rainbow(length(ns))

for ( i in 1:length(ns) ) {
  n <- ns[i]
  N <- 10000 # cantidad de muestras
  g <- gl(N, n)
  x <- rnorm(n*N)
  distribucion_media_muestral <- sapply(split(x, g), FUN=mean)
  if (i == 1)
    plot(density(distribucion_media_muestral), col=cols[i], lwd=2, xlim=c(-1,1),
    )
  else
    lines(density(distribucion_media_muestral), col=cols[i], lwd=2)
}
abline(v=0, col=grey(.8))
legend("topright", title="n = ", as.character(ns), fill=cols)

