import { Component, OnInit } from '@angular/core';

interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  address: string;
  bio: string;
  avatar: string;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img [src]="user.avatar" alt="User Avatar" class="avatar" />
        <h1>{{ user.firstName }} {{ user.lastName }}</h1>
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
        
        <div class="detail-item">
          <strong>Address:</strong>
          <span>{{ user.address }}</span>
        </div>
        
        <div class="detail-item bio">
          <strong>Bio:</strong>
          <p>{{ user.bio }}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
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
    
    .profile-header h1 {
      margin: 10px 0 0;
      color: #333;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 15px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item strong {
      width: 100px;
      color: #555;
    }
    
    .bio {
      flex-direction: column;
    }
    
    .bio p {
      margin: 5px 0 0 0;
      color: #666;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  user: UserProfile = {
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main St, New York, NY 10001',
    bio: 'Software developer with 5 years of experience in web technologies. Passionate about creating user-friendly applications and solving complex problems.',
    avatar: 'https://via.placeholder.com/100x100/4285f4/ffffff?text=JD'
  };

  constructor() { }

  ngOnInit(): void {
  }
}