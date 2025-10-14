package main

import (
	"fmt"
	"time"
)

func printNumbers() {
	for i := 1; i <= 10; i++ {
		fmt.Println(i)
	}
}

func main() {
	go printNumbers()

	// Give the goroutine time to finish before the main function exits
	time.Sleep(100 * time.Millisecond)
}