import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataServiceConfig {
  apiUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com'; // Default API URL

  constructor(private http: HttpClient) { }

  /**
   * Generic GET request
   * @param endpoint API endpoint to fetch data from
   * @returns Observable with the response data
   */
  getData<T>(endpoint: string): Observable<T> {
    return this.http.get<T>(`${this.apiUrl}/${endpoint}`);
  }

  /**
   * Generic POST request
   * @param endpoint API endpoint to send data to
   * @param data Data to send in the request body
   * @returns Observable with the response data
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    
    return this.http.post<T>(`${this.apiUrl}/${endpoint}`, data, { headers });
  }

  /**
   * Generic PUT request
   * @param endpoint API endpoint to update data at
   * @param data Data to send in the request body
   * @returns Observable with the response data
   */
  putData<T>(endpoint: string, data: any): Observable<T> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    
    return this.http.put<T>(`${this.apiUrl}/${endpoint}`, data, { headers });
  }

  /**
   * Generic DELETE request
   * @param endpoint API endpoint to delete data from
   * @returns Observable with the response
   */
  deleteData<T>(endpoint: string): Observable<T> {
    return this.http.delete<T>(`${this.apiUrl}/${endpoint}`);
  }

  /**
   * GET request with custom headers
   * @param endpoint API endpoint to fetch data from
   * @param headers Optional custom headers
   * @returns Observable with the response data
   */
  getDataWithHeaders<T>(endpoint: string, headers: HttpHeaders): Observable<T> {
    return this.http.get<T>(`${this.apiUrl}/${endpoint}`, { headers });
  }
}