package main

import (
	"fmt"
	"time"
)

func printNumbers(ch chan int) {
	for i := 1; i <= 10; i++ {
		ch <- i
	}
	close(ch)
}

func main() {
	ch := make(chan int)
	
	// 启动协程
	go printNumbers(ch)
	
	// 从通道接收数字并打印
	for num := range ch {
		fmt.Println(num)
		time.Sleep(100 * time.Millisecond) // 稍微延迟以便观察输出
	}
}