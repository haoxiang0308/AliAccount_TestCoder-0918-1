import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiServiceConfig {
  baseUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl: string = '';

  constructor(private http: HttpClient) {}

  /**
   * Configure the API service with a base URL
   */
  configure(config: ApiServiceConfig) {
    this.baseUrl = config.baseUrl;
  }

  /**
   * GET request
   */
  get<T>(endpoint: string, options?: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.get<T>(url, options);
  }

  /**
   * POST request
   */
  post<T>(endpoint: string, body: any, options?: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.post<T>(url, body, options);
  }

  /**
   * PUT request
   */
  put<T>(endpoint: string, body: any, options?: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.put<T>(url, body, options);
  }

  /**
   * DELETE request
   */
  delete<T>(endpoint: string, options?: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    return this.http.delete<T>(url, options);
  }

  /**
   * Custom request with headers
   */
  requestWithHeaders<T>(method: string, endpoint: string, body?: any): Observable<T> {
    const url = `${this.baseUrl}${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    
    return this.http.request<T>(method, url, { 
      body: body, 
      headers: headers 
    });
  }
}