import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone?: string;
  address?: string;
  avatar?: string;
  bio?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="'Avatar of ' + user.firstName + ' ' + user.lastName"
          class="avatar"
        >
        <div class="default-avatar" *ngIf="!user.avatar">
          {{ user.firstName.charAt(0) }}{{ user.lastName.charAt(0) }}
        </div>
        <h1>{{ user.firstName }} {{ user.lastName }}</h1>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong> {{ user.email }}
        </div>
        
        <div class="detail-item" *ngIf="user.phone">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong> {{ user.address }}
        </div>
        
        <div class="detail-item" *ngIf="user.bio">
          <strong>Bio:</strong> {{ user.bio }}
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 400px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
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
      font-size: 36px;
      font-weight: bold;
      margin: 0 auto 10px;
    }
    
    .profile-details {
      text-align: left;
    }
    
    .detail-item {
      margin-bottom: 10px;
      padding: 8px 0;
      border-bottom: 1px solid #eee;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}