package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	
	// 设置等待组的数量为10（因为我们要打印10个数字）
	wg.Add(10)
	
	// 启动10个goroutine来打印数字1到10
	for i := 1; i <= 10; i++ {
		go func(num int) {
			defer wg.Done()
			fmt.Println(num)
		}(i)
	}
	
	// 等待所有goroutine完成
	wg.Wait()
}