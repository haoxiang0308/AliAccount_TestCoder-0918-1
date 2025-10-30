# Lista de ejemplo
list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Filtrar números pares
filtered_list = Enum.filter(list, fn x -> rem(x, 2) == 0 end)

# Mapear para elevar al cuadrado
mapped_list = Enum.map(filtered_list, fn x -> x * x end)

# Imprimir resultados
IO.puts("Lista original: #{inspect(list)}")
IO.puts("Números pares: #{inspect(filtered_list)}")
IO.puts("Números pares elevados al cuadrado: #{inspect(mapped_list)}")