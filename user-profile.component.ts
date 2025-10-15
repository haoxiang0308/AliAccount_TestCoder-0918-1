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
    <div class="profile-container">
      <div class="profile-card">
        <h2>User Profile</h2>
        <div *ngIf="user" class="user-details">
          <div class="detail-item">
            <label>Name:</label>
            <span>{{ user.name }}</span>
          </div>
          <div class="detail-item">
            <label>Username:</label>
            <span>{{ user.username }}</span>
          </div>
          <div class="detail-item">
            <label>Email:</label>
            <span>{{ user.email }}</span>
          </div>
          <div class="detail-item">
            <label>Phone:</label>
            <span>{{ user.phone }}</span>
          </div>
          <div class="detail-item">
            <label>Website:</label>
            <span>{{ user.website }}</span>
          </div>
          <div *ngIf="user.address" class="address-section">
            <h3>Address</h3>
            <div class="detail-item">
              <label>City:</label>
              <span>{{ user.address.city }}</span>
            </div>
            <div class="detail-item">
              <label>Street:</label>
              <span>{{ user.address.street }}</span>
            </div>
            <div class="detail-item">
              <label>Suite:</label>
              <span>{{ user.address.suite }}</span>
            </div>
            <div class="detail-item">
              <label>Zipcode:</label>
              <span>{{ user.address.zipcode }}</span>
            </div>
          </div>
          <div *ngIf="user.company" class="company-section">
            <h3>Company</h3>
            <div class="detail-item">
              <label>Name:</label>
              <span>{{ user.company.name }}</span>
            </div>
            <div class="detail-item">
              <label>Catch Phrase:</label>
              <span>{{ user.company.catchPhrase }}</span>
            </div>
            <div class="detail-item">
              <label>BS:</label>
              <span>{{ user.company.bs }}</span>
            </div>
          </div>
        </div>
        <div *ngIf="!user" class="loading">
          Loading user profile...
        </div>
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      display: flex;
      justify-content: center;
      padding: 20px;
    }
    
    .profile-card {
      background: white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      padding: 20px;
      width: 100%;
      max-width: 500px;
    }
    
    .profile-card h2 {
      margin-top: 0;
      color: #333;
      border-bottom: 2px solid #007bff;
      padding-bottom: 10px;
    }
    
    .user-details {
      margin-top: 20px;
    }
    
    .detail-item {
      display: flex;
      margin-bottom: 12px;
      padding-bottom: 8px;
      border-bottom: 1px solid #eee;
    }
    
    .detail-item label {
      font-weight: bold;
      min-width: 100px;
      color: #555;
    }
    
    .detail-item span {
      flex: 1;
      color: #333;
    }
    
    .address-section, .company-section {
      margin-top: 20px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    .address-section h3, .company-section h3 {
      margin-top: 0;
      color: #007bff;
    }
    
    .loading {
      text-align: center;
      padding: 20px;
      color: #666;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  user: User | null = null;

  ngOnInit(): void {
    // In a real app, this would come from a service
    this.user = {
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      username: 'johndoe',
      phone: '1-770-736-8031 x56442',
      website: 'hildegard.org',
      address: {
        street: 'Kulas Light',
        suite: 'Apt. 556',
        city: 'Gwenborough',
        zipcode: '92998-3874'
      },
      company: {
        name: 'Romaguera-Crona',
        catchPhrase: 'Multi-layered client-server neural-net',
        bs: 'harness real-time e-markets'
      }
    };
  }
}