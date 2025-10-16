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
      <div class="profile-header">
        <h2>User Profile</h2>
      </div>
      <div class="profile-content" *ngIf="user">
        <div class="profile-section">
          <h3>Personal Information</h3>
          <p><strong>Name:</strong> {{ user.name }}</p>
          <p><strong>Username:</strong> {{ user.username }}</p>
          <p><strong>Email:</strong> {{ user.email }}</p>
          <p><strong>Phone:</strong> {{ user.phone }}</p>
          <p><strong>Website:</strong> {{ user.website }}</p>
        </div>
        
        <div class="profile-section" *ngIf="user.address">
          <h3>Address</h3>
          <p><strong>Street:</strong> {{ user.address.street }}</p>
          <p><strong>Suite:</strong> {{ user.address.suite }}</p>
          <p><strong>City:</strong> {{ user.address.city }}</p>
          <p><strong>Zipcode:</strong> {{ user.address.zipcode }}</p>
        </div>
        
        <div class="profile-section" *ngIf="user.company">
          <h3>Company</h3>
          <p><strong>Name:</strong> {{ user.company.name }}</p>
          <p><strong>Catch Phrase:</strong> {{ user.company.catchPhrase }}</p>
          <p><strong>BS:</strong> {{ user.company.bs }}</p>
        </div>
      </div>
      <div *ngIf="!user" class="loading">
        Loading user profile...
      </div>
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
    }
    
    .profile-header h2 {
      color: #333;
      margin-bottom: 20px;
    }
    
    .profile-section {
      margin-bottom: 25px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    
    .profile-section h3 {
      color: #555;
      margin-bottom: 10px;
    }
    
    .profile-section p {
      margin: 8px 0;
      color: #666;
    }
    
    .profile-section strong {
      color: #333;
      min-width: 120px;
      display: inline-block;
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
    // Simulating API call to fetch user data
    this.loadUserProfile();
  }

  loadUserProfile(): void {
    // Mock user data - in a real app, this would come from a service
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