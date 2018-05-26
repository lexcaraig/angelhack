import { Component, OnInit } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';

@Component({
  selector: 'angelhack-report-list',
  templateUrl: './report-list.component.html',
  styleUrls: ['./report-list.component.scss']
})
export class ReportListComponent implements OnInit {

  constructor(
    private _afd: AngularFireDatabase
  ) { }

  ngOnInit() {
  }

}
