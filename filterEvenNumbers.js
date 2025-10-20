const fs = require('fs');
const path = require('path');

/**
 * 过滤数组中的偶数
 * @param {number[]} arr - 输入的数字数组
 * @returns {number[]} - 返回包含偶数的新数组
 */
function filterEvenNumbers(arr) {
    if (!Array.isArray(arr)) {
        throw new Error('输入必须是一个数组');
    }
    
    return arr.filter(num => {
        if (typeof num !== 'number' || !Number.isInteger(num)) {
            throw new Error('数组中必须只包含整数');
        }
        return num % 2 === 0;
    });
}

/**
 * 生成随机文件名
 * @param {string} extension - 文件扩展名，默认为 '.txt'
 * @returns {string} - 随机生成的文件名
 */
function generateRandomFileName(extension = '.txt') {
    const randomString = Math.random().toString(36).substring(2, 10);
    const timestamp = Date.now();
    return `${randomString}_${timestamp}${extension}`;
}

/**
 * 过滤数组中的偶数并保存到随机命名的文件中
 * @param {number[]} arr - 输入的数字数组
 * @param {string} [directory='/workspace'] - 保存文件的目录，默认为当前工作目录
 * @returns {string} - 返回保存的文件路径
 */
function filterEvenNumbersAndSave(arr, directory = '/workspace') {
    try {
        // 过滤偶数
        const evenNumbers = filterEvenNumbers(arr);
        
        // 生成随机文件名
        const fileName = generateRandomFileName('.json');
        const filePath = path.join(directory, fileName);
        
        // 将偶数数组保存到文件
        fs.writeFileSync(filePath, JSON.stringify(evenNumbers, null, 2));
        
        console.log(`偶数过滤完成，结果已保存到: ${filePath}`);
        console.log(`过滤出的偶数:`, evenNumbers);
        
        return filePath;
    } catch (error) {
        console.error('处理过程中出现错误:', error.message);
        throw error;
    }
}

// 示例用法
if (require.main === module) {
    // 测试数据
    const testArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    
    console.log('原始数组:', testArray);
    
    // 过滤偶数并保存到文件
    const savedFilePath = filterEvenNumbersAndSave(testArray);
    
    console.log('文件保存路径:', savedFilePath);
}

// 导出函数以便在其他模块中使用
module.exports = {
    filterEvenNumbers,
    filterEvenNumbersAndSave,
    generateRandomFileName
};