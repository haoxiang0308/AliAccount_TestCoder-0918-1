import { Component, Input } from '@angular/core';

interface UserProfile {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  username: string;
  avatar?: string;
  bio?: string;
  joinDate: string;
  location?: string;
  website?: string;
  phone?: string;
}

@Component({
  selector: 'app-user-profile-card',
  template: `
    <div class="user-profile-card">
      <div class="profile-card-header">
        <img 
          [src]="user.avatar || 'https://via.placeholder.com/150'" 
          [alt]="user.firstName + ' ' + user.lastName" 
          class="profile-card-avatar"
        >
        <div class="profile-card-basic-info">
          <h2>{{user.firstName}} {{user.lastName}}</h2>
          <p class="username">@{{user.username}}</p>
          <div class="contact-info">
            <p class="email"><strong>Email:</strong> {{user.email}}</p>
            <p class="phone" *ngIf="user.phone"><strong>Phone:</strong> {{user.phone}}</p>
          </div>
        </div>
      </div>
      
      <div class="profile-card-details">
        <div class="bio" *ngIf="user.bio">
          <h3>Bio</h3>
          <p>{{user.bio}}</p>
        </div>
        
        <div class="additional-info">
          <p class="location" *ngIf="user.location"><strong>Location:</strong> {{user.location}}</p>
          <p class="website" *ngIf="user.website"><strong>Website:</strong> <a [href]="'http://' + user.website" target="_blank">{{user.website}}</a></p>
          <p class="join-date"><strong>Member since:</strong> {{user.joinDate | date}}</p>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .user-profile-card {
      max-width: 500px;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #e0e0e0;
      border-radius: 12px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #fff;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }
    
    .profile-card-header {
      display: flex;
      align-items: flex-start;
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-card-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
      border: 3px solid #f0f0f0;
    }
    
    .profile-card-basic-info h2 {
      margin: 0 0 8px 0;
      font-size: 22px;
      color: #333;
    }
    
    .username {
      color: #666;
      font-size: 16px;
      margin: 0 0 10px 0;
    }
    
    .contact-info {
      margin-top: 10px;
    }
    
    .contact-info p {
      margin: 5px 0;
      color: #555;
    }
    
    .profile-card-details h3 {
      margin-top: 15px;
      margin-bottom: 8px;
      color: #444;
      font-size: 18px;
      border-bottom: 1px solid #eee;
      padding-bottom: 5px;
    }
    
    .bio p {
      margin: 0;
      line-height: 1.6;
      color: #666;
    }
    
    .additional-info p {
      margin: 8px 0;
      color: #555;
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
export class UserProfileCardComponent {
  @Input() user!: UserProfile;
}