import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {
  transform(value: Date | string | null | undefined, format: string = 'yyyy-MM-dd'): string {
    if (!value) {
      return '';
    }

    // 如果输入是字符串，尝试转换为Date对象
    const date = typeof value === 'string' ? new Date(value) : value;

    // 验证日期是否有效
    if (isNaN(date.getTime())) {
      return '';
    }

    // 根据指定格式格式化日期
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // 支持的格式化选项
    const formattedDate = format
      .replace('yyyy', year.toString())
      .replace('MM', month.toString().padStart(2, '0'))
      .replace('dd', day.toString().padStart(2, '0'))
      .replace('HH', hours.toString().padStart(2, '0'))
      .replace('mm', minutes.toString().padStart(2, '0'))
      .replace('ss', seconds.toString().padStart(2, '0'));

    return formattedDate;
  }
}