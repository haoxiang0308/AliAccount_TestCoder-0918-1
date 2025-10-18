const fs = require('fs');
const path = require('path');

// JavaScript函数：过滤数组中的偶数
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// 生成随机文件名
function generateRandomFileName(extension = '.txt') {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let result = '';
    for (let i = 0; i < 10; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result + extension;
}

// 将过滤结果保存到随机命名的文件中
function filterAndSave(arr, outputDir = './') {
    const evenNumbers = filterEvenNumbers(arr);
    const randomFileName = generateRandomFileName('.json'); // 使用.json格式以保持数据结构
    const filePath = path.join(outputDir, randomFileName);
    
    // 将结果写入文件
    fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
    
    console.log(`过滤完成！偶数: [${evenNumbers}] 已保存到文件: ${filePath}`);
    return filePath;
}

// 示例使用
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
const savedFilePath = filterAndSave(numbers);

module.exports = { filterEvenNumbers, filterAndSave, generateRandomFileName };