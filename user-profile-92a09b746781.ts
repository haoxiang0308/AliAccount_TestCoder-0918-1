import { Component, OnInit } from '@angular/core';

interface UserProfile {
  id: string;
  name: string;
  email: string;
  avatar: string;
  bio: string;
  role: string;
  joinDate: Date;
  socialLinks: {
    github: string;
    twitter: string;
    linkedin: string;
  };
}

@Component({
  selector: 'app-user-profile',
  template: `
    <div class="profile-container" *ngIf="profile; else loading">
      <div class="profile-header">
        <img [src]="profile.avatar" [alt]="profile.name" class="avatar">
        <h1>{{ profile.name }}</h1>
        <p class="role">{{ profile.role }}</p>
      </div>

      <div class="profile-content">
        <div class="section">
          <h2>About</h2>
          <p>{{ profile.bio }}</p>
        </div>

        <div class="section">
          <h2>Contact</h2>
          <p><span>Email:</span> <a [href]="'mailto:' + profile.email">{{ profile.email }}</a></p>
        </div>

        <div class="section social-links">
          <h2>Connect</h2>
          <div class="links">
            <a *ngIf="profile.socialLinks.github" [href]="profile.socialLinks.github" target="_blank">
              GitHub
            </a>
            <a *ngIf="profile.socialLinks.twitter" [href]="profile.socialLinks.twitter" target="_blank">
              Twitter
            </a>
            <a *ngIf="profile.socialLinks.linkedin" [href]="profile.socialLinks.linkedin" target="_blank">
              LinkedIn
            </a>
          </div>
        </div>

        <div class="section meta">
          <p>Member since: {{ profile.joinDate | date }}</p>
        </div>
      </div>
    </div>

    <ng-template #loading>
      <div class="loading">Loading profile...</div>
    </ng-template>
  `,
  styles: [`
    .profile-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      font-family: Arial, sans-serif;
    }

    .profile-header {
      text-align: center;
      margin-bottom: 30px;
    }

    .avatar {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 15px;
    }

    .profile-header h1 {
      margin: 0;
      font-size: 28px;
      color: #333;
    }

    .role {
      color: #666;
      font-size: 16px;
      margin: 5px 0 0;
    }

    .section {
      margin-bottom: 25px;
      padding: 15px;
      background: #f9f9f9;
      border-radius: 8px;
    }

    .section h2 {
      margin-top: 0;
      font-size: 18px;
      color: #444;
      border-bottom: 1px solid #ddd;
      padding-bottom: 10px;
    }

    .section p {
      margin: 10px 0;
      line-height: 1.6;
    }

    .section a {
      color: #007bff;
      text-decoration: none;
    }

    .section a:hover {
      text-decoration: underline;
    }

    .links {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
    }

    .links a {
      padding: 8px 16px;
      background: #007bff;
      color: white;
      border-radius: 4px;
      text-decoration: none;
    }

    .links a:hover {
      background: #0056b3;
    }

    .loading {
      text-align: center;
      padding: 40px;
      color: #666;
    }
  `]
})
export class UserProfileComponent implements OnInit {
  profile: UserProfile | null = null;

  constructor() {}

  ngOnInit(): void {
    // In a real application, this would fetch from a service
    this.profile = {
      id: 'user-123',
      name: 'John Doe',
      email: 'john.doe@example.com',
      avatar: 'https://via.placeholder.com/150',
      bio: 'Software developer passionate about building great products. Love working with Angular and modern web technologies.',
      role: 'Senior Developer',
      joinDate: new Date('2024-01-15'),
      socialLinks: {
        github: 'https://github.com/johndoe',
        twitter: 'https://twitter.com/johndoe',
        linkedin: 'https://linkedin.com/in/johndoe'
      }
    };
  }
}
