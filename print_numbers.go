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
	
	// 启动协程来生成数字
	go printNumbers(ch)
	
	// 从通道接收并打印数字
	for num := range ch {
		fmt.Println(num)
		time.Sleep(100 * time.Millisecond) // 添加短暂延迟以观察协程效果
	}
}