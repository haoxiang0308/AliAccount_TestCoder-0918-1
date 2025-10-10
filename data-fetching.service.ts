import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

// Определяем интерфейс для данных, которые ожидаем получить
export interface DataItem {
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root' // Сервис предоставляется на корневом уровне
})
export class DataFetchingService {

  private apiUrl = 'https://jsonplaceholder.typicode.com/users'; // Пример API

  constructor(private http: HttpClient) { }

  /**
   * Метод для получения данных с сервера
   * @returns Observable<DataItem[]>
   */
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }
}