package main

import (
	"fmt"
	"sync"
)

func printNumber(wg *sync.WaitGroup, num int) {
	defer wg.Done() // Decrement the WaitGroup counter when the goroutine finishes
	fmt.Println(num)
}

func main() {
	var wg sync.WaitGroup

	for i := 1; i <= 10; i++ {
		wg.Add(1) // Increment the WaitGroup counter before starting the goroutine
		go printNumber(&wg, i)
	}

	wg.Wait() // Wait for all goroutines to finish
}