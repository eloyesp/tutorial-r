# Copyright Eloy Espinaco (2012)

# Genero (N = 5000) muestras aleatorias de tamaño n = c(5, 10, 50) de la
# distribucion normal estandar y obtengo sus media y desviación estandar. Ploteo
# la grafica y retorna un sumario.


plotDitribucionMuestral <- function(ns=c(5, 10, 50), N=5000, kernel="c",
                                    bw="SJ", estadistico="media", media=0,
                                    varianza=1, aproximar=F, ...) {
  # Genero N muestras aleatorias de tamaño ns = 3 de la distribucion normal
  # estandar y grafica la funcion de densidad de probabilidad de la media o sd.
  # 
  # Args: 
  #   n:  Tamaños de la muestra a evaluar (por defecto `c(5, 10, 50)` )
  #   N:  Cantidad de muestras a obtener para calcular cada funcion de densidad
  #       (por defecto 1000)
  #   FUN: estimador que se desea observar (mean o sd)
  # 
  # Returns: nothing.
  stopifnot( estadistico %in% c("media", "varianza") )

  if ( estadistico == "media" ) {
    FUN <- mean
    valor_buscado <- media
  } else {
    FUN <- var
    valor_buscado <- varianza
  }
  
  ns <- sort(ns, decreasing=T)
  cols <- rainbow(length(ns))
  distribuciones_muestrales <- list()
  
  for ( i in 1:length(ns) ) {
    n <- ns[i]
    name = paste("n = ", n)
    g <- gl(N, n)
    x <- rnorm(n*N, mean=media, sd=varianza^2)
    distribucion_muestral <- sapply(split(x, g), FUN=FUN)
    distribuciones_muestrales[[name]] <- summary(distribucion_muestral)
    density_distribucion_muestral <- density(distribucion_muestral,
                                             kernel=kernel, bw=bw)
    if (i == 1)
      plot(density_distribucion_muestral, col=cols[i], lwd=2, ...)
    else
      lines(density_distribucion_muestral, col=cols[i], lwd=2)
    if (aproximar) {
      if ( estadistico == "media" ) {
        lines(x=density_distribucion_muestral$x, 
              y=dnorm(density_distribucion_muestral$x, mean=media,
                      sd=sqrt(varianza/n)), col=cols[i], lty="dotted")
      } else {
        lines(x=density_distribucion_muestral$x, 
              y=dchisq(density_distribucion_muestral$x, df=n-1),
              col=cols[i], lty="dotted")
      }
    }
  }

  abline(v=valor_buscado, col=grey(.8))
  legend("topright", title="n = ", as.character(ns), fill=cols)

  return(distribuciones_muestrales)
}
