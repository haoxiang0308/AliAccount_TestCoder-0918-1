import { Component, OnInit } from '@angular/core';

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
    <div class="user-profile">
      <h2>User Profile</h2>
      <div *ngIf="user" class="profile-card">
        <h3>{{ user.name }}</h3>
        <p><strong>Username:</strong> {{ user.username }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Phone:</strong> {{ user.phone }}</p>
        <p><strong>Website:</strong> {{ user.website }}</p>
        <div *ngIf="user.address" class="address-section">
          <h4>Address</h4>
          <p>{{ user.address.street }}, {{ user.address.suite }}</p>
          <p>{{ user.address.city }}, {{ user.address.zipcode }}</p>
        </div>
        <div *ngIf="user.company" class="company-section">
          <h4>Company</h4>
          <p>{{ user.company.name }}</p>
          <p>{{ user.company.catchPhrase }}</p>
          <p>{{ user.company.bs }}</p>
        </div>
      </div>
      <div *ngIf="!user" class="loading">
        <p>Loading user profile...</p>
      </div>
    </div>
  `,
  styles: [`
    .user-profile {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      font-family: Arial, sans-serif;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .profile-card h3 {
      color: #333;
      margin-bottom: 15px;
    }
    
    .profile-card p {
      margin: 8px 0;
      line-height: 1.5;
    }
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    .loading {
      text-align: center;
      color: #666;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  user: User | null = null;

  ngOnInit(): void {
    // In a real app, this would fetch data from a service
    this.loadUserProfile();
  }

  loadUserProfile(): void {
    // Mock user data - in a real application, this would come from a service
    this.user = {
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      username: 'johndoe',
      phone: '1-770-736-8031 x56442',
      website: 'hildegard.org'
    };
  }
}