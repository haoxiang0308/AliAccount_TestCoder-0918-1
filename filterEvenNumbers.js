// JavaScript函数：过滤数组中的偶数
function filterEvenNumbers(arr) {
    return arr.filter(num => num % 2 === 0);
}

// 导出函数以便在其他地方使用
module.exports = { filterEvenNumbers };