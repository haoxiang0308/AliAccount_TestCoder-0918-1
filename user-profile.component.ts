import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  address?: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
  };
  company?: {
    name: string;
    catchPhrase: string;
    bs: string;
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile">
      <div class="profile-header">
        <h2>{{ user.name }}</h2>
        <p class="username">@{{ user.username }}</p>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Email:</strong> {{ user.email }}
        </div>
        <div class="detail-item">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        <div class="detail-item">
          <strong>Website:</strong> {{ user.website }}
        </div>
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong>
          <div>{{ user.address.street }}, {{ user.address.suite }}</div>
          <div>{{ user.address.city }}, {{ user.address.zipcode }}</div>
        </div>
        <div class="detail-item" *ngIf="user.company">
          <strong>Company:</strong> {{ user.company.name }}
          <div>{{ user.company.catchPhrase }}</div>
          <div>{{ user.company.bs }}</div>
        </div>
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
    }
    
    .profile-header h2 {
      margin: 0 0 5px 0;
      color: #333;
    }
    
    .username {
      color: #666;
      margin: 0 0 15px 0;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin-bottom: 10px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
    }
  `]
})
export class UserProfileComponent {
  @Input() user!: User;
}