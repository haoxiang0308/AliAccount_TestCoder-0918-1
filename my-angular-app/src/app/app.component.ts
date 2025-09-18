import { Component, OnInit } from '@angular/core';
import { IGKkEvtkBpService } from './services/IGKkEvtkBp.service';

@Component({
  selector: 'app-root',
  template: `
    <h1>Posts</h1>
    <ul>
      <li *ngFor="let post of posts">
        {{ post.title }}
      </li>
    </ul>
  `,
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  posts: any[] = [];

  constructor(private dataService: IGKkEvtkBpService) { }

  ngOnInit(): void {
    this.dataService.getPosts().subscribe(
      (data) => {
        this.posts = data;
      },
      (error) => {
        console.error('Error fetching posts:', error);
      }
    );
  }
}