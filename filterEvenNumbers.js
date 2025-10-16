const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 要过滤的数字数组
 * @param {string} outputDir - 输出目录，默认为当前目录
 * @returns {string} - 生成的文件路径
 */
function filterAndSaveEvenNumbers(array, outputDir = './') {
  // 过滤出偶数
  const evenNumbers = array.filter(num => num % 2 === 0);
  
  // 生成随机文件名
  const randomFileName = `even_numbers_${Date.now()}_${Math.floor(Math.random() * 10000)}.json`;
  const filePath = path.join(outputDir, randomFileName);
  
  // 将偶数数组保存到文件
  fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
  
  console.log(`偶数数组已保存到文件: ${filePath}`);
  console.log('偶数:', evenNumbers);
  
  return filePath;
}

// 示例用法
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFilePath = filterAndSaveEvenNumbers(numbers);

module.exports = { filterAndSaveEvenNumbers };