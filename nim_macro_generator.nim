import macros, os, random, times

# 初始化随机数生成器
randomize()

# 定义一个宏来生成重复代码
macro generateRepeatedCode(count: static[int], code: untyped): untyped =
  ## 生成重复的代码块
  result = newStmtList()
  for i in 0..<count:
    # 创建一个重复的代码块
    let repeatedCode = code.copyNimTree()
    result.add(repeatedCode)

# 定义一个过程来生成并保存宏代码到随机命名的文件
proc generateAndSaveMacroCode(repeatCount: int) =
  # 生成随机文件名
  var randomFileName = ""
  for i in 0..8:
    let randomChar = chr(ord('A') + rand(25))
    randomFileName.add(randomChar)
  randomFileName.add(".nim")
  
  # 打开文件准备写入
  let file = open(randomFileName, fmWrite)
  
  # 生成重复代码的字符串表示
  var codeContent = "import macros\n\n"
  codeContent.add("# Generated repeated code " & $repeatCount & " times\n")
  
  for i in 1..repeatCount:
    codeContent.add("echo \"Generated code block " & $i & "\"\n")
  
  # 写入内容到文件
  file.write(codeContent)
  file.close()
  
  echo "Generated file: ", randomFileName
  echo "Contains ", repeatCount, " repeated code blocks"

# 使用宏的示例
proc exampleUsage() =
  # 使用宏生成重复代码
  generateRepeatedCode(5):
    echo "This line will be repeated"
  
  # 调用生成和保存函数
  generateAndSaveMacroCode(10)

# 运行示例
exampleUsage()