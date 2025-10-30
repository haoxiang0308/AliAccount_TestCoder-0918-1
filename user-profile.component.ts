import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
  joinDate: Date;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="user.name" 
          class="avatar">
        <div class="default-avatar" *ngIf="!user.avatar">{{ user.name.charAt(0) }}</div>
        <div class="user-info">
          <h2>{{ user.name }}</h2>
          <p class="email">{{ user.email }}</p>
          <p class="location" *ngIf="user.location">{{ user.location }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="bio" *ngIf="user.bio">
          <h3>About</h3>
          <p>{{ user.bio }}</p>
        </div>
        
        <div class="join-date">
          <h3>Member since</h3>
          <p>{{ user.joinDate | date:'longDate' }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      margin-right: 15px;
      object-fit: cover;
    }
    
    .default-avatar {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      font-weight: bold;
      margin-right: 15px;
    }
    
    .user-info h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .email {
      color: #666;
      margin: 5px 0;
    }
    
    .location {
      color: #888;
      font-style: italic;
      margin: 0;
    }
    
    .profile-details h3 {
      color: #333;
      margin: 10px 0 5px 0;
    }
    
    .bio p {
      color: #555;
      line-height: 1.5;
    }
    
    .join-date p {
      color: #777;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}