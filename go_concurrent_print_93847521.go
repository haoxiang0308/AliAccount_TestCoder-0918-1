package main

import (
	"fmt"
)

func printNumber(start, end int, done chan bool) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
	done <- true
}

func main() {
	done := make(chan bool)

	go printNumber(1, 5, done)
	go printNumber(6, 10, done)

	<-done
	<-done
}