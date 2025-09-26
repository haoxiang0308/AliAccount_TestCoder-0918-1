package main

import (
	"fmt"
)

func printNumbers(start, end int) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
}

func main() {
	// Start the printing in a goroutine
	go printNumbers(1, 10)

	// Give the goroutine time to finish before the main function exits
	// In a real application, you might use channels or sync.WaitGroup for synchronization
	// Here, a simple loop is used to demonstrate the goroutine running concurrently.
	for i := 0; i < 5; i++ {
		// This loop just ensures main doesn't exit immediately
		// A real sync mechanism is better.
	}
}