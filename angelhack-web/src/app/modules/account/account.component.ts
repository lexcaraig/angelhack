import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'angelhack-account',
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.scss']
})
export class AccountComponent implements OnInit {
  public navLinks = [
    { path: '/account/dashboard', name: 'Dashboard', icon: 'compare_arrows' }
  ];

  constructor() { }

  ngOnInit() {
  }

}
