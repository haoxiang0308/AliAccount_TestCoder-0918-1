import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <h2>{{ user.name }}</h2>
      <p><strong>Email:</strong> {{ user.email }}</p>
      <p *ngIf="user.bio"><strong>Bio:</strong> {{ user.bio }}</p>
    </div>
  `,
  styles: [`
    .user-profile {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 8px;
      max-width: 400px;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
 // Example usage within the component itself if needed for standalone testing
  // user: UserProfile = {
  //   id: 1,
  //   name: 'John Doe',
  //   email: 'john.doe@example.com',
  //   bio: 'Software Developer'
  // };
}