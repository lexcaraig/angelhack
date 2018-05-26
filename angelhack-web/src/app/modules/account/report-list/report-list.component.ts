import { Component, OnInit, Input } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';

import { Reports } from '../../../shared/mocks/reports.mock';

@Component({
  selector: 'angelhack-report-list',
  templateUrl: './report-list.component.html',
  styleUrls: ['./report-list.component.scss']
})
export class ReportListComponent implements OnInit {
  columns = ['name', 'type', 'preview', 'actions'];
  reportsMock = Reports;

  constructor(private _afd: AngularFireDatabase) {}

  ngOnInit() {}
}
