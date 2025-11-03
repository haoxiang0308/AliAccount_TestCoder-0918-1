import { Component, OnInit } from '@angular/core';

export interface UserProfile {
  id: number;
  name: string;
  email: string;
  phone: string;
  address: string;
  bio: string;
  avatar: string;
  joinDate: Date;
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container">
      <div class="profile-header">
        <img [src]="userProfile.avatar || 'https://via.placeholder.com/150'" 
             alt="Profile Avatar" 
             class="profile-avatar">
        <h1>{{ userProfile.name }}</h1>
      </div>
      
      <div class="profile-details">
        <div class="detail-item">
          <label>Email:</label>
          <span>{{ userProfile.email }}</span>
        </div>
        
        <div class="detail-item">
          <label>Phone:</label>
          <span>{{ userProfile.phone }}</span>
        </div>
        
        <div class="detail-item">
          <label>Address:</label>
          <span>{{ userProfile.address }}</span>
        </div>
        
        <div class="detail-item">
          <label>Member Since:</label>
          <span>{{ userProfile.joinDate | date:'longDate' }}</span>
        </div>
        
        <div class="detail-item bio-section">
          <label>Bio:</label>
          <p>{{ userProfile.bio }}</p>
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
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      font-family: Arial, sans-serif;
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
    }
    
    .profile-avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 15px;
    }
    
    .profile-header h1 {
      margin: 0;
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
    
    .detail-item label {
      font-weight: bold;
      width: 120px;
      color: #555;
    }
    
    .detail-item span {
      flex: 1;
      color: #333;
    }
    
    .bio-section p {
      margin: 0;
      color: #666;
      line-height: 1.5;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  userProfile: UserProfile = {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    address: '123 Main Street, New York, NY 10001',
    bio: 'Software developer with 5+ years of experience in web technologies. Passionate about creating user-friendly applications.',
    avatar: 'https://via.placeholder.com/150',
    joinDate: new Date('2022-01-15')
  };

  constructor() { }

  ngOnInit(): void {
    // This is where you would typically load user data from a service
  }
}