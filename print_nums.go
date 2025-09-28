package main

import (
	"fmt"
	"sync"
)

func printNumbers(start, end int, wg *sync.WaitGroup) {
	defer wg.Done() // Notify that this goroutine is done when the function exits
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
}

func main() {
	var wg sync.WaitGroup
	wg.Add(1) // We are waiting for 1 goroutine

	// Start the printing function as a goroutine
	go printNumbers(1, 10, &wg)

	// Wait for the goroutine to finish before the main function exits
	wg.Wait()
}