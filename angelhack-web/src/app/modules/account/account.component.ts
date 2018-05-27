import { Component, OnInit } from '@angular/core';
import { ObservableMedia } from '@angular/flex-layout';

@Component({
  selector: 'angelhack-account',
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.scss']
})
export class AccountComponent implements OnInit {
  public navLinks = [
    { path: '/account/dashboard', name: 'Dashboard', icon: 'dashboard' }
  ];

  public sideNavMode: string;
  public isSideNavHidden: boolean;

  constructor(
    private _observableMedia: ObservableMedia
  ) { }

  ngOnInit() {
    this._observableMedia.subscribe(data => {
      if ( data.mqAlias === 'sm' || data.mqAlias === 'xs' ) {
        this.isSideNavHidden = false;
        this.sideNavMode = 'over';
      } else {
        this.isSideNavHidden = true;
        this.sideNavMode = 'side';
      }
    });
  }

}
