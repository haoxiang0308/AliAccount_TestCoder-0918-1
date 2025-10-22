import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
  location?: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img 
          *ngIf="user.avatar" 
          [src]="user.avatar" 
          [alt]="user.name" 
          class="profile-avatar">
        <div class="default-avatar" *ngIf="!user.avatar">{{ user.name.charAt(0) }}</div>
        <div class="profile-basic-info">
          <h2>{{ user.name }}</h2>
          <p class="email">{{ user.email }}</p>
        </div>
      </div>
      
      <div class="profile-details">
        <div class="detail-item" *ngIf="user.bio">
          <label>Bio:</label>
          <p>{{ user.bio }}</p>
        </div>
        
        <div class="detail-item" *ngIf="user.location">
          <label>Location:</label>
          <p>{{ user.location }}</p>
        </div>
        
        <div class="detail-item">
          <label>Member Since:</label>
          <p>{{ user.joinDate | date:'longDate' }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 500px;
      margin: 20px auto;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      font-family: Arial, sans-serif;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }
    
    .profile-avatar {
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
      font-size: 32px;
      font-weight: bold;
      margin-right: 15px;
    }
    
    .profile-basic-info h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .email {
      margin: 0;
      color: #666;
    }
    
    .profile-details {
      border-top: 1px solid #eee;
      padding-top: 15px;
    }
    
    .detail-item {
      margin-bottom: 12px;
    }
    
    .detail-item label {
      font-weight: bold;
      color: #555;
      display: inline-block;
      width: 100px;
    }
    
    .detail-item p {
      display: inline-block;
      margin: 0;
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: UserProfile;
}