import { Component, Input } from '@angular/core';

export interface User {
  id: number;
  name: string;
  email: string;
  username: string;
  bio?: string; // Optional property
}

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent {
  @Input() user: User = {
    id: 0,
    name: 'Loading...',
    email: 'loading@example.com',
    username: 'loading'
  };
}