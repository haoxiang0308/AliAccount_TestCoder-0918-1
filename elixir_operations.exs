# Crear una lista en Elixir
lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

# Filtrar los números pares
filtrada = Enum.filter(lista, fn x -> rem(x, 2) == 0 end)

# Mapear para elevar al cuadrado cada número filtrado
mapeada = Enum.map(filtrada, fn x -> x * x end)

# Mostrar los resultados
IO.puts("Lista original: #{inspect(lista)}")
IO.puts("Lista filtrada (números pares): #{inspect(filtrada)}")
IO.puts("Lista mapeada (cuadrados de números pares): #{inspect(mapeada)}")

# Generar un nombre de archivo aleatorio
random_name = "resultado_#{:rand.uniform(10000)}.txt"
File.write(random_name, "Lista original: #{inspect(lista)}\nLista filtrada (números pares): #{inspect(filtrada)}\nLista mapeada (cuadrados de números pares): #{inspect(mapeada)}\n")

IO.puts("Resultados guardados en: #{random_name}")