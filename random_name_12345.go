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
	// Start a goroutine to print numbers 1 to 10
	go printNumbers(1, 10)

	// Give the goroutine time to finish before the main function exits
	// In a real application, you would use a sync.WaitGroup or channel for this.
	// For simplicity here, we use a short sleep.
	// However, a more idiomatic Go solution would use channels or sync primitives.
	// Since the request is to just print, we'll add a small delay to ensure printing happens.
	// A simple way without additional imports is to use a blocking channel receive.
	done := make(chan bool)
	go func() {
		printNumbers(1, 10)
		done <- true
	}()

	// Wait for the goroutine to finish
	<-done
}