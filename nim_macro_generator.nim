import macros, strutils, random, times

# 初始化随机数生成器
randomize()

# 宏：生成重复代码
macro generateRepeatedCode(count: static[int], code: untyped): untyped =
  ## 生成重复的代码块
  result = newStmtList()
  for i in 0..<count:
    let newCode = code.copy()
    # 如果代码是语句，给它添加一个唯一的标识符以便查看效果
    case newCode.kind:
    of nnkCall:
      # 如果是函数调用，添加一个序号参数
      var call = newCode
      if call.len > 0:
        let idx = newLit(i)
        call.add idx
    else:
      # 其他情况，直接复制
      discard
    result.add newCode

# 更通用的宏：生成重复代码块
macro repeatCode(count: static[int], body: untyped): untyped =
  ## 重复执行指定次数的代码块
  result = newStmtList()
  for i in 0..<count:
    let stmt = body.copy()
    result.add stmt

# 生成随机文件名的函数
proc generateRandomNimFilename(): string =
  let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  var filename = "generated_"
  for i in 0..10:
    filename.add chars[rand(chars.len - 1)]
  filename.add ".nim"
  return filename

# 主程序：使用宏生成代码并保存到随机命名的文件
proc main() =
  # 使用宏生成重复代码
  var generatedCode = ""
  
  # 生成一些示例代码
  generatedCode.add "# Generated code using Nim macro\n"
  generatedCode.add "import std/[strutils, sequtils]\n\n"
  
  # 使用repeatCode宏生成重复代码
  generatedCode.add "proc exampleFunction() =\n"
  for i in 0..<5:  # 生成5个重复的代码行
    generatedCode.add "  echo \"This is repeated line " & $i & "\"\n"
  
  generatedCode.add "\n"
  generatedCode.add "when isMainModule:\n"
  generatedCode.add "  exampleFunction()\n"
  
  # 生成随机文件名
  let filename = generateRandomNimFilename()
  
  # 将生成的代码写入文件
  writeFile(filename, generatedCode)
  echo "Generated code saved to: ", filename

# 调用主程序
main()