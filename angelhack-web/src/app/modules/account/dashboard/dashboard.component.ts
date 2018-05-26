import { Component, OnInit } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';
import { Router } from '@angular/router';

@Component({
  selector: 'angelhack-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  public services = [
    { avatar: '', name: 'LTO', title: 'Land Transfortaion Office', description: 'Something' }
  ];

  constructor(
    private _afd: AngularFireDatabase,
    private _router: Router
  ) { }

  ngOnInit() {
  }

}
