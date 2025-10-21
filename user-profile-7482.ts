import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
  joinDate?: Date;
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
        <div *ngIf="!user.avatar" class="default-avatar">
          {{ user.name.charAt(0).toUpperCase() }}
        </div>
        <div class="user-info">
          <h2>{{ user.name }}</h2>
          <p class="email">{{ user.email }}</p>
          <p *ngIf="user.location" class="location">📍 {{ user.location }}</p>
        </div>
      </div>
      
      <div class="profile-details" *ngIf="user.bio || user.joinDate">
        <div *ngIf="user.bio" class="bio">
          <h3>About</h3>
          <p>{{ user.bio }}</p>
        </div>
        
        <div *ngIf="user.joinDate" class="join-date">
          <h3>Member since</h3>
          <p>{{ user.joinDate | date:'longDate' }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      background-color: #fff;
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
      object-fit: cover;
      margin-right: 15px;
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
      font-size: 32px;
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
      margin: 5px 0 0 0;
      font-size: 14px;
    }
    
    .profile-details h3 {
      margin: 15px 0 5px 0;
      color: #555;
      font-size: 16px;
    }
    
    .bio p, .join-date p {
      margin: 0 0 15px 0;
      color: #666;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    name: '',
    email: '',
    bio: '',
    joinDate: new Date(),
    location: ''
  };
}