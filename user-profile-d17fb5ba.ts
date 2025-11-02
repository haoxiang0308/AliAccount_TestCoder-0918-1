import { Component, Input } from '@angular/core';

interface User {
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
    <div class="profile-container">
      <div class="profile-header">
        <h2>{{ user.name }}'s Profile</h2>
      </div>
      <div class="profile-details">
        <div class="detail-item">
          <label><strong>ID:</strong></label>
          <span>{{ user.id }}</span>
        </div>
        <div class="detail-item">
          <label><strong>Name:</strong></label>
          <span>{{ user.name }}</span>
        </div>
        <div class="detail-item">
          <label><strong>Username:</strong></label>
          <span>{{ user.username }}</span>
        </div>
        <div class="detail-item">
          <label><strong>Email:</strong></label>
          <span>{{ user.email }}</span>
        </div>
        <div class="detail-item">
          <label><strong>Phone:</strong></label>
          <span>{{ user.phone }}</span>
        </div>
        <div class="detail-item">
          <label><strong>Website:</strong></label>
          <span>{{ user.website }}</span>
        </div>
        <div *ngIf="user.address" class="address-section">
          <h3>Address</h3>
          <div class="detail-item">
            <label><strong>Street:</strong></label>
            <span>{{ user.address.street }}</span>
          </div>
          <div class="detail-item">
            <label><strong>Suite:</strong></label>
            <span>{{ user.address.suite }}</span>
          </div>
          <div class="detail-item">
            <label><strong>City:</strong></label>
            <span>{{ user.address.city }}</span>
          </div>
          <div class="detail-item">
            <label><strong>Zipcode:</strong></label>
            <span>{{ user.address.zipcode }}</span>
          </div>
        </div>
        <div *ngIf="user.company" class="company-section">
          <h3>Company</h3>
          <div class="detail-item">
            <label><strong>Name:</strong></label>
            <span>{{ user.company.name }}</span>
          </div>
          <div class="detail-item">
            <label><strong>Catch Phrase:</strong></label>
            <span>{{ user.company.catchPhrase }}</span>
          </div>
          <div class="detail-item">
            <label><strong>BS:</strong></label>
            <span>{{ user.company.bs }}</span>
          </div>
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
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .profile-header {
      text-align: center;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-header h2 {
      color: #333;
      margin: 0;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 10px;
      padding: 8px 0;
      border-bottom: 1px solid #f5f5f5;
    }
    
    .detail-item label {
      min-width: 120px;
      font-weight: bold;
      color: #555;
    }
    
    .detail-item span {
      flex: 1;
      color: #333;
    }
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    .address-section h3, .company-section h3 {
      margin-top: 0;
      color: #444;
    }
  `]
})
export class UserProfileComponent {
  @Input() user: User = {
    id: 0,
    name: 'Loading...',
    email: '',
    username: '',
    phone: '',
    website: ''
  };
}