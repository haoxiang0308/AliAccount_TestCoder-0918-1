import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';

// Интерфейс для типизации данных
export interface DataItem {
  id: number;
  name: string;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Пример API

  constructor(private http: HttpClient) { }

  // Получение всех данных
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl)
      .pipe(
        retry(3), // Повторить запрос до 3 раз в случае ошибки
        catchError(this.handleError)
      );
  }

  // Получение данных по ID
  getDataById(id: number): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<DataItem>(url)
      .pipe(
        catchError(this.handleError)
      );
  }

  // Создание новых данных
  createData(item: DataItem): Observable<DataItem> {
    return this.http.post<DataItem>(this.apiUrl, item)
      .pipe(
        catchError(this.handleError)
      );
  }

  // Обновление данных
  updateData(id: number, item: DataItem): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<DataItem>(url, item)
      .pipe(
        catchError(this.handleError)
      );
  }

  // Удаление данных
  deleteData(id: number): Observable<unknown> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete(url)
      .pipe(
        catchError(this.handleError)
      );
  }

  // Обработка ошибок
  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'Unknown error!';
    if (error.error instanceof ErrorEvent) {
      // Ошибка на стороне клиента
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Ошибка на стороне сервера
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    console.error(errorMessage);
    return throwError(errorMessage);
  }
}