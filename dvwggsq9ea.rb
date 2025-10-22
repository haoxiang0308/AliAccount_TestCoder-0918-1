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

# 使用map块转换数组
puts "\n使用map块将所有元素转换为字符串："
string_array = array.map { |element| element.to_s }
string_array.each { |element| puts element }

# 使用select块筛选元素
puts "\n使用select块筛选数字："
numbers = array.select { |element| element.is_a?(Numeric) }
numbers.each { |num| puts num }