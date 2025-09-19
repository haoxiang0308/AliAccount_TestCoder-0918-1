import { Component, OnInit } from '@angular/core';
import { DataServiceO0wcTrLtFC } from './services/data-service-O0wcTrLtFC';

@Component({
  selector: 'app-root',
  template: `
    <h1>Angular HTTP Service Example</h1>
    <ul>
      <li *ngFor="let item of data">
        {{ item.title }}
      </li>
    </ul>
  `,
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'angular-service-example';
  data: any[] = [];

  constructor(private dataService: DataServiceO0wcTrLtFC) { }

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