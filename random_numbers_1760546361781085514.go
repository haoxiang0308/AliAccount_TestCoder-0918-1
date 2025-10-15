package main

import (
	"fmt"
	"time"
)

func printNumber(num int) {
	fmt.Println(num)
}

func main() {
	// 使用通道来同步协程
	done := make(chan bool)

	// 启动10个协程来打印数字1到10
	for i := 1; i <= 10; i++ {
		go func(n int) {
			printNumber(n)
			done <- true
		}(i)
	}

	// 等待所有协程完成
	for i := 1; i <= 10; i++ {
		<-done
	}
	
	// 添加一个小延迟确保所有输出都已完成
	time.Sleep(100 * time.Millisecond)
}