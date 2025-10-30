# Función para calcular la desviación estándar
calcular_desviacion_estandar <- function(datos) {
  if (!is.numeric(datos)) {
    stop("El vector debe contener solo valores numéricos.")
  }
  
  if (length(datos) == 0) {
    stop("El vector no puede estar vacío.")
  }
  
  media <- mean(datos)
  varianza <- sum((datos - media)^2) / (length(datos) - 1)
  desviacion_estandar <- sqrt(varianza)
  
  return(desviacion_estandar)
}

# Ejemplo de uso:
# datos_ejemplo <- c(1, 2, 3, 4, 5)
# resultado <- calcular_desviacion_estandar(datos_ejemplo)
# print(resultado)