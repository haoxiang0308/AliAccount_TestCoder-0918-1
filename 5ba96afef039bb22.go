package main

import "fmt"

func main() {
	// Crear un slice vacío
	mySlice := []string{}

	// Agregar elementos al slice
	mySlice = append(mySlice, "elemento1")
	mySlice = append(mySlice, "elemento2")
	mySlice = append(mySlice, "elemento3")

	// Imprimir el slice resultante
	fmt.Println("Slice después de agregar elementos:", mySlice)
}