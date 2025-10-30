import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiServiceConfig {
  baseUrl?: string;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private defaultBaseUrl = 'https://jsonplaceholder.typicode.com';

  constructor(private http: HttpClient) {}

  /**
   * GET request
   * @param endpoint API endpoint to call
   * @param config Optional configuration
   * @returns Observable of the response
   */
  get<T>(endpoint: string, config?: ApiServiceConfig): Observable<T> {
    const url = this.buildUrl(endpoint, config?.baseUrl);
    return this.http.get<T>(url);
  }

  /**
   * POST request
   * @param endpoint API endpoint to call
   * @param data Data to send in the request body
   * @param config Optional configuration
   * @returns Observable of the response
   */
  post<T>(endpoint: string, data: any, config?: ApiServiceConfig): Observable<T> {
    const url = this.buildUrl(endpoint, config?.baseUrl);
    return this.http.post<T>(url, data);
  }

  /**
   * PUT request
   * @param endpoint API endpoint to call
   * @param data Data to send in the request body
   * @param config Optional configuration
   * @returns Observable of the response
   */
  put<T>(endpoint: string, data: any, config?: ApiServiceConfig): Observable<T> {
    const url = this.buildUrl(endpoint, config?.baseUrl);
    return this.http.put<T>(url, data);
  }

  /**
   * DELETE request
   * @param endpoint API endpoint to call
   * @param config Optional configuration
   * @returns Observable of the response
   */
  delete<T>(endpoint: string, config?: ApiServiceConfig): Observable<T> {
    const url = this.buildUrl(endpoint, config?.baseUrl);
    return this.http.delete<T>(url);
  }

  /**
   * Helper method to build the full URL
   */
  private buildUrl(endpoint: string, baseUrl?: string): string {
    const base = baseUrl || this.defaultBaseUrl;
    // Ensure the endpoint doesn't start with a slash to avoid incorrect URLs
    const normalizedEndpoint = endpoint.startsWith('/') ? endpoint.substring(1) : endpoint;
    return `${base}/${normalizedEndpoint}`;
  }
}