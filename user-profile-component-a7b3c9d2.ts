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
             [alt]="profile.name"
             class="avatar">
        <ng-template #defaultAvatar>
          <div class="default-avatar">{{ getInitials() }}</div>
        </ng-template>
        <h2>{{ profile.name }}</h2>
      </div>
      
      <div class="profile-details">
        <p><strong>Email:</strong> {{ profile.email }}</p>
        <p *ngIf="profile.bio"><strong>Bio:</strong> {{ profile.bio }}</p>
        <p *ngIf="profile.location"><strong>Location:</strong> {{ profile.location }}</p>
        <p *ngIf="profile.website">
          <strong>Website:</strong> 
          <a [href]="profile.website" target="_blank">{{ profile.website }}</a>
        </p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
      font-size: 36px;
      font-weight: bold;
      margin: 0 auto 10px;
    }
    
    h2 {
      margin: 0;
      color: #333;
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

  getInitials(): string {
    const names = this.profile.name.split(' ');
    if (names.length === 1) {
      return names[0].charAt(0).toUpperCase();
    }
    return names[0].charAt(0).toUpperCase() + names[names.length - 1].charAt(0).toUpperCase();
  }
}