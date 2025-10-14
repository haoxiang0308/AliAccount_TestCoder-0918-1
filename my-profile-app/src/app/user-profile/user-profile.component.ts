import { Component } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <h2>User Profile</h2>
      <div class="profile-card">
        <p><strong>Name:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p *ngIf="user.bio"><strong>Bio:</strong> {{ user.bio }}</p>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 400px;
      margin: 2rem auto;
      padding: 1rem;
      font-family: Arial, sans-serif;
    }
    .profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 1rem;
      background-color: #f9f9f9;
    }
    p {
      margin: 0.5rem 0;
    }
  `]
})
export class UserProfileComponent {
  user: UserProfile = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    bio: 'Software Developer'
  };
}