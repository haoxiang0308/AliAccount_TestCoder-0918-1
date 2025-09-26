import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataItem {
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchingService {

  private apiUrl = 'https://jsonplaceholder.typicode.com/users'; // Пример API

  constructor(private http: HttpClient) { }

  /**
   * Получает список элементов данных с удаленного API.
   * @returns Observable, который выдает массив объектов DataItem.
   */
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }

  /**
   * Получает один элемент данных по его ID.
   * @param id - Уникальный идентификатор элемента.
   * @returns Observable, который выдает объект DataItem.
   */
  getDataById(id: number): Observable<DataItem> {
    return this.http.get<DataItem>(`${this.apiUrl}/${id}`);
  }

  /**
   * Отправляет новые данные на удаленный API.
   * @param item - Новый элемент данных для отправки.
   * @returns Observable, который выдает созданный объект DataItem.
   */
  createData(item: Omit<DataItem, 'id'>): Observable<DataItem> {
    return this.http.post<DataItem>(this.apiUrl, item);
  }

  /**
   * Обновляет существующий элемент данных.
   * @param item - Элемент данных для обновления.
   * @returns Observable, который выдает обновленный объект DataItem.
   */
  updateData(item: DataItem): Observable<DataItem> {
    return this.http.put<DataItem>(`${this.apiUrl}/${item.id}`, item);
  }

  /**
   * Удаляет элемент данных по его ID.
   * @param id - Уникальный идентификатор элемента для удаления.
   * @returns Observable, который выдает объект результата удаления.
   */
  deleteData(id: number): Observable<unknown> {
    return this.http.delete(`${this.apiUrl}/${id}`);
  }
}