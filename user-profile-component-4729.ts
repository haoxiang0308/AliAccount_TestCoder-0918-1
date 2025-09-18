import { Component, Input } from '@angular/core';

export interface UserProfile {
  name: string;
  email: string;
  age: number;
  location: string;
  bio: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <h2>{{ userProfile.name }}</h2>
      <p><strong>Email:</strong> {{ userProfile.email }}</p>
      <p><strong>Age:</strong> {{ userProfile.age }}</p>
      <p><strong>Location:</strong> {{ userProfile.location }}</p>
      <p><strong>Bio:</strong> {{ userProfile.bio }}</p>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      border-radius: 8px;
      padding: 20px;
      max-width: 400px;
      margin: 20px auto;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }

    .user-profile h2 {
      color: #333;
      margin-top: 0;
    }

    .user-profile p {
      margin: 10px 0;
    }

    .user-profile strong {
      color: #555;
    }
  `]
})
export class UserProfileComponent {
  @Input() userProfile: UserProfile = {
    name: 'John Doe',
    email: 'john.doe@example.com',
    age: 30,
    location: 'New York, USA',
    bio: 'Software developer with a passion for creating amazing web applications.'
  };
}