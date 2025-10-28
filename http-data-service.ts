import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ApiResponse {
  // Define the structure of your API response here
  [key: string]: any;
}

@Injectable({
  providedIn: 'root'
})
export class HttpDataService {
  private baseUrl: string = 'https://api.example.com'; // Replace with your API base URL

  constructor(private http: HttpClient) { }

  // GET request
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url);
  }

  // POST request
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.post<T>(url, data, { headers });
  }

  // PUT request
  updateData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    return this.http.put<T>(url, data, { headers });
  }

  // DELETE request
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.delete<T>(url);
  }

  // Custom request with options
  customRequest<T>(method: string, endpoint: string, data?: any, options?: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    
    switch (method.toUpperCase()) {
      case 'GET':
        return this.http.get<T>(url, options);
      case 'POST':
        return this.http.post<T>(url, data, options);
      case 'PUT':
        return this.http.put<T>(url, data, options);
      case 'DELETE':
        return this.http.delete<T>(url, options);
      default:
        throw new Error(`Unsupported HTTP method: ${method}`);
    }
  }
}
