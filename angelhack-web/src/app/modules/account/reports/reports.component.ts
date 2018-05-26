import { Component, OnInit } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';

import { Reports } from '../../../shared/mocks/reports.mock';

@Component({
  selector: 'angelhack-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.scss']
})
export class ReportsComponent implements OnInit {
  isPending: boolean = false;

  constructor(private _afd: AngularFireDatabase) {}

  ngOnInit() {}

  onFilter() {
    this.isPending = !this.isPending;
  }
}
