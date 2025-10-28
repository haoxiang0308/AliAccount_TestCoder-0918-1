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
      <h2>User Profile</h2>
      <div *ngIf="user" class="profile-card">
        <div class="profile-header">
          <h3>{{ user.name }}</h3>
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
          
          <div *ngIf="user.address" class="address-section">
            <h4>Address</h4>
            <div class="detail-item">
              <strong>Street:</strong> {{ user.address.street }}
            </div>
            <div class="detail-item">
              <strong>Suite:</strong> {{ user.address.suite }}
            </div>
            <div class="detail-item">
              <strong>City:</strong> {{ user.address.city }}
            </div>
            <div class="detail-item">
              <strong>ZIP Code:</strong> {{ user.address.zipcode }}
            </div>
          </div>
          
          <div *ngIf="user.company" class="company-section">
            <h4>Company</h4>
            <div class="detail-item">
              <strong>Name:</strong> {{ user.company.name }}
            </div>
            <div class="detail-item">
              <strong>Catch Phrase:</strong> {{ user.company.catchPhrase }}
            </div>
            <div class="detail-item">
              <strong>BS:</strong> {{ user.company.bs }}
            </div>
          </div>
        </div>
      </div>
      
      <div *ngIf="!user" class="loading">
        Loading user profile...
      </div>
    </div>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      font-family: Arial, sans-serif;
    }
    
    .profile-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      background-color: #f9f9f9;
    }
    
    .profile-header {
      border-bottom: 1px solid #eee;
      padding-bottom: 15px;
      margin-bottom: 15px;
    }
    
    .username {
      color: #666;
      font-style: italic;
    }
    
    .profile-details {
      display: flex;
      flex-direction: column;
    }
    
    .detail-item {
      margin-bottom: 10px;
      padding: 5px 0;
    }
    
    .address-section, .company-section {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px solid #eee;
    }
    
    h4 {
      margin-bottom: 10px;
      color: #333;
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
    // Simulating loading user data
    this.loadUserProfile();
  }

  loadUserProfile(): void {
    // In a real application, this would be an HTTP request
    setTimeout(() => {
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
    }, 500);
  }
}