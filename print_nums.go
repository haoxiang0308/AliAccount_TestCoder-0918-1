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
	// 启动一个goroutine来打印数字1到10
	go printNumbers(1, 10)

	// 为了确保goroutine有机会执行，主函数等待片刻
	// 在实际应用中，应使用sync.WaitGroup等更可靠的方法
	fmt.Scanln() // 等待用户按回车
}