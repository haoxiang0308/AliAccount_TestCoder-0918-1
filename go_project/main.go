package main

import (
	"fmt"
	"math/rand"
	"time"
)

func printNumber(num int, ch chan bool) {
	fmt.Println(num)
	// 模拟一些工作
	time.Sleep(time.Millisecond * time.Duration(rand.Intn(100)))
	// 通知主协程这个协程已完成
	ch <- true
}

func main() {
	// 创建一个通道用于等待所有协程完成
	done := make(chan bool)

	// 启动10个协程
	for i := 1; i <= 10; i++ {
		go printNumber(i, done)
	}

	// 等待所有协程完成
	for i := 1; i <= 10; i++ {
		<-done
	}

	fmt.Println("All numbers printed.")
}