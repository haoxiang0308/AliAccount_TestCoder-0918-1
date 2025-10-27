package main

import (
	"fmt"
	"time"
)

func printNumbers(ch chan int, start, end int) {
	for i := start; i <= end; i++ {
		ch <- i
	}
	close(ch)
}

func main() {
	ch := make(chan int)
	
	// Start the goroutine to send numbers
	go printNumbers(ch, 1, 10)
	
	// Receive and print numbers
	for num := range ch {
		fmt.Println(num)
		// Small delay to see the concurrent behavior
		time.Sleep(100 * time.Millisecond)
	}
}