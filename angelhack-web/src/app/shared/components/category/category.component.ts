import { Component, OnInit, Input, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'angelhack-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.scss']
})
export class CategoryComponent implements OnInit {
  @Input('avatar')      avatar:       string = '';
  @Input('name')        name:         string = '';
  @Input('title')       title:        string = '';
  @Input('description') description:  string = '';

  constructor() { }

  ngOnInit() {
  }

}
