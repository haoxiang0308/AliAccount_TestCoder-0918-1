package main

import (
	"fmt"
)

func printNumber(i int) {
	fmt.Println(i)
}

func main() {
	for i := 1; i <= 10; i++ {
		go printNumber(i)
	}

	// 简单的等待，确保所有goroutine完成
	// 在实际应用中，应使用sync.WaitGroup
	for i := 0; i < 10; i++ {
		// 空的select语句会阻塞，直到有case可以执行（这里没有case，所以会永久阻塞）
		// 这是一种不推荐的等待方式，仅用于演示
	}
}
