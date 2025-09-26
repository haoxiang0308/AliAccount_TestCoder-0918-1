package main

import (
	"fmt"
	"time"
)

func printNumbers(start, end int) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
		time.Sleep(time.Millisecond * 100) // 添加短暂延迟以观察并发效果
	}
}

func main() {
	// 启动一个goroutine来打印1到5
	go printNumbers(1, 5)

	// 在主goroutine中打印6到10
	printNumbers(6, 10)

	// 给goroutine一些时间来完成
	time.Sleep(time.Second * 2)
}