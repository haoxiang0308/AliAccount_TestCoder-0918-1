import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry, map } from 'rxjs/operators';

export interface ApiResponse<T = any> {
  data?: T;
  message?: string;
  status?: number;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private baseUrl = 'https://jsonplaceholder.typicode.com'; // Example API

  constructor(private http: HttpClient) { }

  // Generic GET request
  getData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    return this.http.get<T>(url).pipe(
      retry(2),
      catchError(this.handleError)
    );
  }

  // Generic POST request
  postData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    
    return this.http.post<T>(url, data, { headers }).pipe(
      catchError(this.handleError)
    );
  }

  // Generic PUT request
  updateData<T>(endpoint: string, data: any): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });
    
    return this.http.put<T>(url, data, { headers }).pipe(
      catchError(this.handleError)
    );
  }

  // Generic DELETE request
  deleteData<T>(endpoint: string): Observable<T> {
    const url = `${this.baseUrl}/${endpoint}`;
    
    return this.http.delete<T>(url).pipe(
      catchError(this.handleError)
    );
  }

  // Error handling
  private handleError(error: HttpErrorResponse) {
    let errorMessage = 'An unknown error occurred!';
    
    if (error.error instanceof ErrorEvent) {
      // Client-side error
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    
    console.error(errorMessage);
    return throwError(errorMessage);
  }
}