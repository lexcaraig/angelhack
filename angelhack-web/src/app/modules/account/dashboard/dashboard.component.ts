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
    {
      avatar: 'lto-header-image',
      name: 'LTO',
      title: 'Land Transportation Office',
      description: 'Something'
    },
    {
      avatar: 'mmda-header-image',
      name: 'MMDA',
      title: 'Metropolitan Manila Dev\'t Authority',
      description: 'Something'
    },
    {
      avatar: 'lgu-header-image',
      name: 'LGU',
      title: 'Local Government Unit',
      description: 'Something'
    }
  ];

  constructor(private _afd: AngularFireDatabase, private _router: Router) {}

  ngOnInit() {}
}
