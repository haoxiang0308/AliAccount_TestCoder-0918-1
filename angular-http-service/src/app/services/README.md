# Angular HTTP Service

This module provides a service for fetching data from a REST API using Angular's HttpClient.

## Files

- `data-fetch.service.ts`: The main service for HTTP requests
- `services.module.ts`: Angular module that provides the service
- `index.ts`: Barrel file for easy imports

## Usage

1. Import the ServicesModule in your app module:
```typescript
import { ServicesModule } from './services';

@NgModule({
  imports: [
    // other imports
    ServicesModule
  ],
  // ...
})
export class AppModule { }
```

2. Inject the DataFetchService in your components:
```typescript
import { DataFetchService, DataItem } from './services';

@Component({...})
export class MyComponent {
  data: DataItem[] = [];
  
  constructor(private dataService: DataFetchService) {}
  
  ngOnInit() {
    this.dataService.getData().subscribe(
      (result) => this.data = result
    );
  }
}
```

## Methods

- `getData(): Observable<DataItem[]>` - Fetches all items from the API
- `getDataById(id: number): Observable<DataItem>` - Fetches a specific item by ID
