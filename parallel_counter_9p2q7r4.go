package main

import (
	"fmt"
)

func printNumber(ch chan int, num int) {
	ch <- num
}

func main() {
	ch := make(chan int, 10) // Buffer the channel to hold all numbers

	for i := 1; i <= 10; i++ {
		go printNumber(ch, i)
	}

	// Collect results
	for i := 1; i <= 10; i++ {
		num := <-ch
		fmt.Println(num)
	}
}