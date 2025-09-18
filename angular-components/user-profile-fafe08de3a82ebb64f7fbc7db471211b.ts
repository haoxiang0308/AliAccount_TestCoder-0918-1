import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatarUrl?: string;
  bio?: string;
  location?: string;
  website?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img *ngIf="profile.avatarUrl; else defaultAvatar" 
             [src]="profile.avatarUrl" 
             alt="{{ profile.name }}'s avatar" 
             class="avatar">
        <ng-template #defaultAvatar>
          <div class="default-avatar">{{ profile.name.charAt(0) }}</div>
        </ng-template>
        <h2>{{ profile.name }}</h2>
      </div>
      
      <div class="profile-details">
        <p><strong>Email:</strong> {{ profile.email }}</p>
        <p *ngIf="profile.bio"><strong>Bio:</strong> {{ profile.bio }}</p>
        <p *ngIf="profile.location"><strong>Location:</strong> {{ profile.location }}</p>
        <p *ngIf="profile.website">
          <strong>Website:</strong> 
          <a [href]="profile.website" target="_blank" rel="noopener">{{ profile.website }}</a>
        </p>
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
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
    }
    
    .avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 10px;
    }
    
    .default-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background-color: #007bff;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 40px;
      font-weight: bold;
      margin: 0 auto 10px;
    }
    
    .profile-details p {
      margin: 10px 0;
      line-height: 1.5;
    }
    
    a {
      color: #007bff;
      text-decoration: none;
    }
    
    a:hover {
      text-decoration: underline;
    }
  `]
})
export class UserProfileComponent {
  @Input() profile: UserProfile = {
    id: 0,
    name: '',
    email: ''
  };
}