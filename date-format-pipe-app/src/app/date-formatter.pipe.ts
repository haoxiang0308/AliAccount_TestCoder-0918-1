import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date string or Date object into a more readable form.
 * Example usage: {{ dateValue | dateFormat:'yyyy-MM-dd' }}
 */
@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  /**
   * Transforms the input date value according to the specified format string.
   * @param value The input date, can be a Date object, a string, or null/undefined.
   * @param format The desired date format string (e.g., 'yyyy-MM-dd', 'dd/MM/yyyy').
   * @returns A formatted date string, or the original value if it's null/undefined.
   */
  transform(value: Date | string | null | undefined, format?: string): string | Date | string | null | undefined {
    if (value === null || value === undefined) {
      return value;
    }

    const date = value instanceof Date ? value : new Date(value);
    if (isNaN(date.getTime())) {
      // Handle invalid date
      return 'Invalid Date';
    }

    // Default format if none is provided
    const finalFormat = format || 'yyyy-MM-dd';

    // Simple format replacements for demonstration.
    // A full implementation would handle all possible format strings.
    const year = date.getFullYear().toString();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    const hours = date.getHours().toString().padStart(2, '0');
    const minutes = date.getMinutes().toString().padStart(2, '0');
    const seconds = date.getSeconds().toString().padStart(2, '0');

    return finalFormat
      .replace('yyyy', year)
      .replace('MM', month)
      .replace('dd', day)
      .replace('HH', hours)
      .replace('mm', minutes)
      .replace('ss', seconds);
  }
}