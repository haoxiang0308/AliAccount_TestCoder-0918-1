import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface DataServiceConfig {
  baseUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataFetchService {
  private baseUrl: string = '';

  constructor(private http: HttpClient) {}

  /**
   * Configure the service with a base URL
   */
  configure(config: DataServiceConfig) {
    this.baseUrl = config.baseUrl;
  }

  /**
   * GET request
   */
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  /**
   * POST request
   */
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.post<T>(url, data);
  }

  /**
   * PUT request
   */
  putData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.put<T>(url, data);
  }

  /**
   * DELETE request
   */
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  /**
   * Generic request with custom headers
   */
  requestWithHeaders<T>(endpoint: string, method: string, data?: any, headers?: HttpHeaders): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    
    if (!headers) {
      headers = new HttpHeaders({
        'Content-Type': 'application/json'
      });
    }

    switch (method.toUpperCase()) {
      case 'GET':
        return this.http.get<T>(url, { headers });
      case 'POST':
        return this.http.post<T>(url, data, { headers });
      case 'PUT':
        return this.http.put<T>(url, data, { headers });
      case 'DELETE':
        return this.http.delete<T>(url, { headers });
      default:
        throw new Error(`Unsupported HTTP method: ${method}`);
    }
  }
}