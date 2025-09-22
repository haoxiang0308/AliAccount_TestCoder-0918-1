# Angular HTTP Data Service

This project demonstrates how to create an Angular service for fetching data via HTTP.

## DataService

The `DataService` is located in `src/app/data.service.ts`. It uses Angular's `HttpClient` to fetch data from a REST API.

### Key Features:
- Uses `HttpClient` for making HTTP requests
- Provides a `getData()` method that returns an Observable
- Configured with a default API endpoint (https://jsonplaceholder.typicode.com/posts)

### Usage:

1. Import the service in your component:
```typescript
import { DataService } from './data.service';
```

2. Inject the service in your component's constructor:
```typescript
constructor(private dataService: DataService) { }
```

3. Use the service in your component:
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

## DataDisplayComponent

The `DataDisplayComponent` in `src/app/data-display.component.ts` demonstrates how to use the `DataService` to fetch and display data.

## AppModule

The `AppModule` in `src/app/app.module.ts` is configured with:
- `HttpClientModule` for HTTP functionality
- Declaration of `DataDisplayComponent`

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.io/cli) page.
