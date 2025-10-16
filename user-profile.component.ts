import { Component, Input } from '@angular/core';

interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
  website: string;
  company?: {
    name: string;
    catchPhrase: string;
    bs: string;
  };
  address?: {
    street: string;
    suite: string;
    city: string;
    zipcode: string;
    geo: {
      lat: string;
      lng: string;
    };
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="user-profile" *ngIf="user">
      <div class="profile-header">
        <h2>{{ user.name }}'s Profile</h2>
        <p class="username">@{{ user.username }}</p>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <strong>Name:</strong> {{ user.name }}
        </div>
        <div class="detail-item">
          <strong>Email:</strong> {{ user.email }}
        </div>
        <div class="detail-item">
          <strong>Phone:</strong> {{ user.phone }}
        </div>
        <div class="detail-item">
          <strong>Website:</strong> {{ user.website }}
        </div>
        <div class="detail-item" *ngIf="user.company">
          <strong>Company:</strong> {{ user.company.name }}
        </div>
        <div class="detail-item" *ngIf="user.address">
          <strong>Address:</strong>
          <div class="address-details">
            {{ user.address.street }}, {{ user.address.suite }}<br>
            {{ user.address.city }}, {{ user.address.zipcode }}
          </div>
        </div>
      </div>
    </div>
    
    <div *ngIf="!user" class="no-user">
      <p>No user data available</p>
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
      background-color: #f9f9f9;
    }
    
    .profile-header h2 {
      margin: 0 0 10px 0;
      color: #333;
    }
    
    .username {
      color: #666;
      font-style: italic;
      margin: 0 0 20px 0;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      padding: 10px 0;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item:last-child {
      border-bottom: none;
    }
    
    .address-details {
      margin-top: 5px;
      padding: 5px 0 0 15px;
    }
    
    .no-user {
      text-align: center;
      padding: 20px;
      color: #666;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User | null = null;
}