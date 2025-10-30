# Función para calcular la desviación estándar
calcular_desviacion_estandar <- function(datos) {
  if (!is.numeric(datos)) {
    stop("El vector de datos debe ser numérico")
  }
  
  if (length(datos) == 0) {
    stop("El vector de datos no puede estar vacío")
  }
  
  # Calcular la desviación estándar
  desv_est <- sqrt(var(datos))
  return(desv_est)
}

# Ejemplo de uso:
# datos_ejemplo <- c(1, 2, 3, 4, 5)
# resultado <- calcular_desviacion_estandar(datos_ejemplo)
# print(resultado)