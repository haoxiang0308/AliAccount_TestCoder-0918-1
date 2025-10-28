# C++ 模板交换函数与随机文件保存

这个项目包含一个C++模板函数，用于交换两个变量的值，并将结果保存到随机命名的文件中。

## 功能说明

1. `swapValues<T>(T& a, T& b)` - 通用模板函数，用于交换两个变量的值
2. `generateRandomFilename()` - 生成随机文件名
3. `saveSwapResult<T>(T& a, T& b, const std::string& description)` - 交换值并将结果保存到随机命名的文件中

## 文件结构

- `swap_template.cpp` - 主程序源代码
- `swap_result_*.txt` - 生成的随机命名结果文件

## 编译和运行

```bash
g++ -o swap_template swap_template.cpp
./swap_template
```

## 示例输出

程序会生成类似以下的输出：
```
Before swap: x = 10, y = 20
Swap result saved to file: swap_result_471204.txt
After swap: x = 20, y = 10
```

结果文件包含交换后的值：
```
Swap Result
============
Description: Integer swap example
Value A: 20
Value B: 10
```