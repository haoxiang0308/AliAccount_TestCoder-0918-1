#!/usr/bin/env ruby

# 创建一个示例数组
arr = [1, 2, 3, 4, 5, 'hello', 'world', 10.5]

# 使用each块遍历数组并打印每个元素
puts "使用each块遍历数组:"
arr.each do |element|
  puts element
end

puts "\n使用块的另一种方式遍历数组:"
# 也可以使用大括号形式的块
arr.each { |element| puts "元素: #{element}" }

puts "\n使用map块转换数组:"
# 使用map块创建新数组
squared = arr.select { |element| element.is_a?(Numeric) }.map { |num| num * num }
puts "数字元素的平方: #{squared}"

puts "\n使用each_with_index块遍历数组，同时获取索引:"
arr.each_with_index do |element, index|
  puts "索引 #{index}: #{element}"
end