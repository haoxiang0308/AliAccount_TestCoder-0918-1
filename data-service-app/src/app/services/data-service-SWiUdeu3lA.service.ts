import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

// Define an interface for the data structure
export interface DataItem {
  id: number;
  name: string;
  description: string;
}

@Injectable({
  providedIn: 'root'
})
export class DataServiceService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Example API endpoint

  constructor(private http: HttpClient) { }

  // GET request to fetch data
  getData(): Observable<DataItem[]> {
    return this.http.get<DataItem[]>(this.apiUrl);
  }

  // GET request to fetch a single item by ID
  getDataById(id: number): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<DataItem>(url);
  }

  // POST request to create new data
  createData(item: DataItem): Observable<DataItem> {
    return this.http.post<DataItem>(this.apiUrl, item);
  }

  // PUT request to update existing data
  updateData(id: number, item: DataItem): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<DataItem>(url, item);
  }

  // DELETE request to remove data
  deleteData(id: number): Observable<DataItem> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete<DataItem>(url);
  }
}