package main

import (
	"fmt"
	"sync"
	"time"
)

var wg sync.WaitGroup

func printNumbers(start, end int) {
	// 函数执行完毕时，调用 Done 来通知 WaitGroup
	defer wg.Done()
	for i := start; i <= end; i++ {
		fmt.Println(i)
		// 添加短暂休眠以观察并发效果
		time.Sleep(100 * time.Millisecond)
	}
}

func main() {
	// 告知 WaitGroup 即将等待一个协程
	wg.Add(1)
	// 启动一个Go协程来执行打印任务
	go printNumbers(1, 10)

	// 等待所有已添加到 WaitGroup 的协程完成
	wg.Wait()
	fmt.Println("All goroutines finished.")
}