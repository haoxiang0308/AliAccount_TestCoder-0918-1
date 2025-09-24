import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'customDateFormat'
})
export class CustomDateFormatPipe implements PipeTransform {

  transform(value: any, format: string = 'mediumDate'): string {
    if (!value) return '';
    const date = new Date(value);
    if (isNaN(date.getTime())) {
      console.error('Invalid date:', value);
      return '';
    }

    // This is a simplified date formatter.
    // In a real Angular app, you would use the built-in DatePipe or a library like date-fns.
    // For this example, we'll just return the toLocaleDateString result based on a simple format string.
    switch (format) {
      case 'short':
        return date.toLocaleDateString('en-US');
      case 'long':
        return date.toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' });
      case 'iso':
        return date.toISOString().substring(0, 10); // YYYY-MM-DD
      default:
        return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
    }
  }
}