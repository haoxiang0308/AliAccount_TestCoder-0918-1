import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'; // Импортируем HttpClientModule

import { AppComponent } from './app.component';
import { DataService } from './services/data.service'; // Импортируем сервис

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule // Добавляем в imports
  ],
  providers: [
    DataService // Добавляем сервис в providers
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }