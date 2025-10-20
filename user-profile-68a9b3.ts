import { Component, Input } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  address?: string;
  avatar?: string;
  bio?: string;
  joinDate?: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <img *ngIf="user.avatar" [src]="user.avatar" [alt]="user.name" class="avatar" />
        <div *ngIf="!user.avatar" class="default-avatar">{{ getInitials(user.name) }}</div>
        <h2>{{ user.name }}</h2>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong>
          <span>{{ user.email }}</span>
        </div>
        
        <div class="detail-item">
          <strong>Phone:</strong>
          <span>{{ user.phone }}</span>
        </div>
        
        <div *ngIf="user.address" class="detail-item">
          <strong>Address:</strong>
          <span>{{ user.address }}</span>
        </div>
        
        <div *ngIf="user.bio" class="detail-item">
          <strong>Bio:</strong>
          <p>{{ user.bio }}</p>
        </div>
        
        <div *ngIf="user.joinDate" class="detail-item">
          <strong>Member since:</strong>
          <span>{{ user.joinDate | date }}</span>
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
      font-size: 24px;
      font-weight: bold;
      margin: 0 auto 10px;
    }
    
    .profile-details {
      text-align: left;
    }
    
    .detail-item {
      margin-bottom: 12px;
      padding-bottom: 8px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
    }
    
    .detail-item strong {
      display: inline-block;
      width: 100px;
      color: #333;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: UserProfile = {
    id: 0,
    name: '',
    email: '',
    phone: ''
  };
  
  getInitials(name: string): string {
    if (!name) return '';
    const names = name.split(' ');
    const initials = names.map(n => n.charAt(0)).join('');
    return initials.substring(0, 2).toUpperCase();
  }
}