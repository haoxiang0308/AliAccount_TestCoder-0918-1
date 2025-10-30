package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	
	// 设置等待组计数器
	wg.Add(10)
	
	// 启动10个协程打印数字1到10
	for i := 1; i <= 10; i++ {
		go func(num int) {
			defer wg.Done()
			fmt.Println(num)
		}(i)
	}
	
	// 等待所有协程完成
	wg.Wait()
}