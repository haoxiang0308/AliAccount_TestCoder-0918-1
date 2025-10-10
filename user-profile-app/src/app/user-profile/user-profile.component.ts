import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div *ngIf="user">
      <h2>{{ user.name }}'s Profile</h2>
      <p><strong>Email:</strong> {{ user.email }}</p>
      <p *ngIf="user.bio"><strong>Bio:</strong> {{ user.bio }}</p>
    </div>
    <div *ngIf="!user">
      <p>User not found.</p>
    </div>
  `,
  styles: [`
    div {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      border-radius: 4px;
      max-width: 400px;
    }
    h2 {
      margin-top: 0;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | null = null;
}