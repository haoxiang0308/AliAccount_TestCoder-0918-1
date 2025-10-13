import { Component, OnInit } from '@angular/core';
import { DataService, DataItem } from './services/data.service'; // Импортируем сервис и интерфейс

@Component({
  selector: 'app-root',
  template: `
    <h1>Данные с сервера:</h1>
    <ul>
      <li *ngFor="let item of dataList">
        {{ item.id }}: {{ item.name }}
      </li>
    </ul>
  `,
  standalone: true,
})
export class AppComponent implements OnInit {
  title = 'my-angular-app';
  dataList: DataItem[] = [];

  constructor(private dataService: DataService) {}

  ngOnInit(): void {
    this.dataService.getData().subscribe(
      (data) => {
        this.dataList = data;
      },
      (error) => {
        console.error('Ошибка при получении данных:', error);
      }
    );
  }
}