import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  transform(value: any, format?: string): string {
    if (!value) return '';
    
    const date = new Date(value);
    if (isNaN(date.getTime())) return value;
    
    // Default format: YYYY-MM-DD
    if (!format) {
      return date.getFullYear() + '-' + 
             this.padZero(date.getMonth() + 1) + '-' + 
             this.padZero(date.getDate());
    }
    
    // Handle different format patterns
    return format
      .replace('YYYY', date.getFullYear().toString())
      .replace('MM', this.padZero(date.getMonth() + 1))
      .replace('DD', this.padZero(date.getDate()))
      .replace('HH', this.padZero(date.getHours()))
      .replace('mm', this.padZero(date.getMinutes()))
      .replace('ss', this.padZero(date.getSeconds()));
  }
  
  private padZero(num: number): string {
    return num < 10 ? '0' + num : num.toString();
  }
}