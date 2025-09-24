package main

import (
	"fmt"
	"time"
)

func printNumbers(start, end int, done chan bool) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
		time.Sleep(100 * time.Millisecond) // Optional: small delay to see the concurrency
	}
	done <- true // Signal that this goroutine is done
}

func main() {
	done := make(chan bool)

	// Start a goroutine to print numbers 1 to 10
	go printNumbers(1, 10, done)

	// Wait for the goroutine to finish
	<-done
}