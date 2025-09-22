import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormatter'
})
export class DateFormatterPipe implements PipeTransform {

  transform(value: any, ...args: any[]): any {
    if (!value) return '';

    // 尝试将输入值转换为 Date 对象
    const date = new Date(value);
    if (isNaN(date.getTime())) {
      // 如果转换失败，返回原始值或一个错误提示
      console.error('Invalid date value provided to dateFormatter pipe:', value);
      return value;
    }

    // 定义选项来格式化日期
    const options: Intl.DateTimeFormatOptions = {
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: false // 使用24小时制
    };

    // 使用本地化日期格式化函数
    return new Intl.DateTimeFormat('zh-CN', options).format(date);
  }

}