import { Component, OnInit } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';

@Component({
  selector: 'angelhack-report-details',
  templateUrl: './report-details.component.html',
  styleUrls: ['./report-details.component.scss']
})
export class ReportDetailsComponent implements OnInit {

  constructor(
    private _afd: AngularFireDatabase
  ) { }

  ngOnInit() {
  }

}
