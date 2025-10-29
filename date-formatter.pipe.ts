import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormatter'
})
export class DateFormatterPipe implements PipeTransform {
  transform(value: any, format: string = 'mediumDate'): string {
    if (!value) {
      return '';
    }

    // 尝试将输入值转换为Date对象
    const date = new Date(value);
    
    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      console.warn('Invalid date:', value);
      return String(value);
    }

    // 根据指定的格式返回格式化的日期字符串
    switch (format) {
      case 'short':
        return date.toLocaleDateString();
      case 'medium':
        return date.toLocaleDateString('en-US', {
          year: 'numeric',
          month: 'short',
          day: 'numeric'
        });
      case 'long':
        return date.toLocaleDateString('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });
      case 'full':
        return date.toLocaleDateString('en-US', {
          weekday: 'long',
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });
      case 'time':
        return date.toLocaleTimeString();
      case 'datetime':
        return date.toLocaleString();
      case 'iso':
        return date.toISOString();
      case 'dd/mm/yyyy':
        return `${date.getDate().toString().padStart(2, '0')}/${(date.getMonth() + 1).toString().padStart(2, '0')}/${date.getFullYear()}`;
      case 'mm/dd/yyyy':
        return `${(date.getMonth() + 1).toString().padStart(2, '0')}/${date.getDate().toString().padStart(2, '0')}/${date.getFullYear()}`;
      case 'yyyy-mm-dd':
        return `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}`;
      default:
        return date.toLocaleDateString();
    }
  }
}