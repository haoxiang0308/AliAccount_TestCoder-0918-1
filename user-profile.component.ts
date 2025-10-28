import { Component, Input } from '@angular/core';

interface User {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  username: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          [src]="user.avatar || 'https://via.placeholder.com/150'" 
          alt="{{user.firstName}} {{user.lastName}}" 
          class="profile-avatar"
        >
        <div class="profile-info">
          <h1>{{user.firstName}} {{user.lastName}}</h1>
          <p class="username">@{{user.username}}</p>
          <p class="email">{{user.email}}</p>
          <p class="location" *ngIf="user.location">{{user.location}}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="bio" *ngIf="user.bio">
          <h3>About</h3>
          <p>{{user.bio}}</p>
        </div>
        
        <div class="join-date">
          <h3>Member since</h3>
          <p>{{user.joinDate | date}}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .profile-avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
    }
    
    .profile-info h1 {
      margin: 0 0 5px 0;
      font-size: 24px;
    }
    
    .username {
      color: #666;
      font-size: 16px;
      margin: 0 0 5px 0;
    }
    
    .email {
      color: #333;
      margin: 0 0 5px 0;
    }
    
    .location {
      color: #888;
      font-style: italic;
      margin: 0;
    }
    
    .profile-details h3 {
      margin-top: 15px;
      margin-bottom: 5px;
      color: #444;
    }
    
    .bio p {
      margin: 0;
      line-height: 1.5;
    }
    
    .join-date p {
      margin: 0;
      color: #666;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
}