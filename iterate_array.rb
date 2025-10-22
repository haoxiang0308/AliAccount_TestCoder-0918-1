#!/usr/bin/env ruby

# 创建一个示例数组
array = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# 使用each块遍历数组并打印每个元素
puts "遍历数组中的元素："
array.each do |element|
  puts element
end

# 使用另一种语法的块
puts "\n使用大括号语法遍历："
array.each { |element| puts "元素: #{element}" }