import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  avatar?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <img *ngIf="user.avatar" [src]="user.avatar" [alt]="user.name" class="avatar">
      <h2>{{ user.name }}</h2>
      <p>Email: {{ user.email }}</p>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      padding: 16px;
      border-radius: 8px;
      max-width: 400px;
      margin: 16px;
    }
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      display: block;
      margin: 0 auto 16px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
 // You can add methods here to handle user actions, like editing the profile
}