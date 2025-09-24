import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataFetcherService {

  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Пример API

  constructor(private http: HttpClient) { }

  /**
   * Метод для получения данных через HTTP GET запрос
   * @returns Observable<any> - Observable с данными с сервера
   */
  getData(): Observable<any> {
    return this.http.get(this.apiUrl);
  }

  /**
   * Метод для отправки данных через HTTP POST запрос
   * @param data - Данные для отправки
   * @returns Observable<any> - Observable с ответом сервера
   */
  sendData(data: any): Observable<any> {
    return this.http.post(this.apiUrl, data);
  }
}