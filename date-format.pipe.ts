import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {
  transform(value: string | Date | null | undefined, format: string = 'yyyy-MM-dd'): string {
    if (!value) {
      return '';
    }

    const date = new Date(value);
    
    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return '';
    }

    const year = date.getFullYear();
    const month = date.getMonth() + 1; // 月份从0开始，所以需要+1
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // 根据格式字符串进行格式化
    let formattedDate = format;
    formattedDate = formattedDate.replace('yyyy', year.toString());
    formattedDate = formattedDate.replace('MM', month.toString().padStart(2, '0'));
    formattedDate = formattedDate.replace('dd', day.toString().padStart(2, '0'));
    formattedDate = formattedDate.replace('HH', hours.toString().padStart(2, '0'));
    formattedDate = formattedDate.replace('mm', minutes.toString().padStart(2, '0'));
    formattedDate = formattedDate.replace('ss', seconds.toString().padStart(2, '0'));

    return formattedDate;
  }
}