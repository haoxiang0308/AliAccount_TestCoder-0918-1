import { Component } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <h2>User Profile</h2>
      <div *ngIf="user">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
      <div *ngIf="!user">
        <p>Loading...</p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      padding: 16px;
      max-width: 400px;
      margin: 20px auto;
      font-family: Arial, sans-serif;
    }
    h2 {
      margin-top: 0;
    }
  `]
})
export class UserProfileComponent {
  user: User | undefined;

  // Simulate loading user data
  ngOnInit() {
    // This could come from a service
    this.user = {
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      role: 'Admin'
    };
  }
}