# Using the Angular HTTP Data Service

This document explains how to use the Angular HTTP Data Service we created.

## Service Implementation

The service is implemented in `src/app/data.service.ts` and has the following key parts:

1. **Importing dependencies**:
```typescript
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
```

2. **Service decorator and injection**:
```typescript
@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  constructor(private http: HttpClient) { }
```

3. **Data fetching method**:
```typescript
  getData(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }
```

## Module Configuration

To use the service, you need to ensure `HttpClientModule` is imported in your app module (`src/app/app.module.ts`):

```typescript
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  imports: [
    // other imports
    HttpClientModule
  ],
  // ...
})
export class AppModule { }
```

## Component Usage

To use the service in a component:

1. Import the service:
```typescript
import { DataService } from '../data.service'; // Adjust path as needed
```

2. Inject it in the constructor:
```typescript
constructor(private dataService: DataService) { }
```

3. Call the service method in your component logic (e.g., in `ngOnInit`):
```typescript
ngOnInit(): void {
  this.dataService.getData().subscribe(
    (response) => {
      this.data = response;
    },
    (error) => {
      console.error('Error fetching data:', error);
    }
  );
}
```

## Example Component

We've included an example component (`DataDisplayComponent`) that demonstrates usage:

```typescript
import { Component, OnInit } from '@angular/core';
import { DataService } from '../data.service';

@Component({
  selector: 'app-data-display',
  template: `
    <div>
      <h2>Data from API:</h2>
      <ul>
        <li *ngFor="let item of data">
          {{ item.title }}
        </li>
      </ul>
    </div>
  `,
  styleUrls: ['./data-display.component.css']
})
export class DataDisplayComponent implements OnInit {
  data: any[] = [];

  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    this.dataService.getData().subscribe(
      (response) => {
        this.data = response;
      },
      (error) => {
        console.error('Error fetching data:', error);
      }
    );
  }
}
```

This component fetches data when initialized and displays it in a list.