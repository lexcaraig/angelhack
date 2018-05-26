import { Component, OnInit } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';

@Component({
  selector: 'angelhack-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.scss']
})
export class ReportsComponent implements OnInit {
  public isPending: boolean = false;

  constructor(
    private _afd: AngularFireDatabase
  ) { }

  ngOnInit() {
  }

  onFilter() {
    this.isPending = !this.isPending;
  }

}
