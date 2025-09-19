import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { DataServiceO0wcTrLtFC } from './services/data-service-O0wcTrLtFC';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [DataServiceO0wcTrLtFC],
  bootstrap: [AppComponent]
})
export class AppModule { }