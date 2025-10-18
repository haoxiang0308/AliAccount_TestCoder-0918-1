const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} array - 输入的数字数组
 * @param {string} [directory='/workspace'] - 保存文件的目录
 * @returns {string} - 生成的文件路径
 */
function filterEvenNumbersAndSave(array, directory = '/workspace') {
  // 过滤偶数
  const evenNumbers = array.filter(num => num % 2 === 0);
  
  // 生成随机文件名
  const randomFileName = `even_numbers_${Math.floor(Math.random() * 1000000000)}.json`;
  const filePath = path.join(directory, randomFileName);
  
  // 将偶数数组保存到文件
  fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
  
  console.log(`偶数已过滤并保存到文件: ${filePath}`);
  console.log(`原数组: [${array.join(', ')}]`);
  console.log(`偶数数组: [${evenNumbers.join(', ')}]`);
  
  return filePath;
}

// 示例用法
const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFilePath = filterEvenNumbersAndSave(testArray);

module.exports = { filterEvenNumbersAndSave };