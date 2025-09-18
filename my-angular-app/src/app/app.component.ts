import { Component, OnInit } from '@angular/core';
import { DataFetchService, DataItem } from './services/data-fetch.service';

@Component({
  selector: 'app-root',
  template: `
    <h1>Angular HTTP Data Fetching</h1>
    <ul>
      <li *ngFor="let item of dataItems">
        <h2>{{ item.title }}</h2>
        <p>{{ item.body }}</p>
      </li>
    </ul>
  `
})
export class AppComponent implements OnInit {
  dataItems: DataItem[] = [];

  constructor(private dataFetchService: DataFetchService) {}

  ngOnInit(): void {
    this.dataFetchService.getData().subscribe({
      next: (data) => {
        // Mapping to our DataItem interface (simplified)
        this.dataItems = data.slice(0, 5); // Taking first 5 items
      },
      error: (error) => {
        console.error('Error fetching data:', error);
      }
    });
  }
}