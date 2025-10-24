package main

import (
	"fmt"
	"time"
)

func printNumber(num int) {
	fmt.Println(num)
}

func main() {
	// Launch goroutines to print numbers 1 to 10
	for i := 1; i <= 10; i++ {
		go printNumber(i)
	}
	
	// Small delay to ensure all goroutines finish before main exits
	time.Sleep(100 * time.Millisecond)
}