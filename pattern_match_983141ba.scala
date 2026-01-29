object PatternMatchingExample {

  /**
   * Función que usa pattern matching para clasificar valores.
   * @param value el valor a clasificar
   * @return una cadena describiendo el tipo de valor
   */
  def classify(value: Any): String = value match {
    case n: Int if n > 0 => s"Entero positivo: $n"
    case n: Int if n < 0 => s"Entero negativo: $n"
    case n: Int if n == 0 => "Cero"
    case s: String if s.isEmpty => "Cadena vacía"
    case s: String => s"Cadena: '$s' (longitud: ${s.length})"
    case b: Boolean => s"Booleano: $b"
    case l: List[_] if l.isEmpty => "Lista vacía"
    case l: List[_] => s"Lista con ${l.length} elementos"
    case null => "Nulo"
    case _ => "Valor desconocido"
  }

  def main(args: Array[String]): Unit = {
    // Ejemplos de uso
    println(classify(42))
    println(classify(-5))
    println(classify(0))
    println(classify("Hola"))
    println(classify(""))
    println(classify(true))
    println(classify(List(1, 2, 3)))
    println(classify(Nil))
    println(classify(null))
  }
}
