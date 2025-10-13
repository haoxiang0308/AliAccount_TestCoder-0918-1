import { Component } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-user-profile',
  standalone: true,
  template: `
    <div class="user-profile">
      <h2>User Profile</h2>
      <div *ngIf="user">
        <p><strong>ID:</strong> {{ user.id }}</p>
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Role:</strong> {{ user.role }}</p>
      </div>
      <p *ngIf="!user">Loading user data...</p>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-family: Arial, sans-serif;
    }
  `]
})
export class UserProfileComponent {
  user: User | undefined;

  ngOnInit() {
    // Simulate fetching user data
    this.user = {
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      role: 'Admin'
    };
  }
}