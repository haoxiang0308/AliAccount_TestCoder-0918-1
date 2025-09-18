import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { IGKkEvtkBpService } from './services/IGKkEvtkBp.service';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [IGKkEvtkBpService],
  bootstrap: [AppComponent]
})
export class AppModule { }