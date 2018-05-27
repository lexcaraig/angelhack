import { Component, OnInit, Input } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';
import { MatDialog } from '@angular/material';
import { ReportDetailsDialogComponent } from '../report-details-dialog/report-details-dialog.component';

import { Reports } from '../../../shared/mocks/reports.mock';

@Component({
  selector: 'angelhack-report-list',
  templateUrl: './report-list.component.html',
  styleUrls: ['./report-list.component.scss']
})
export class ReportListComponent implements OnInit {
  columns = ['name', 'type', 'date', 'actions'];
  reportsMock = Reports;

  constructor(
    private _afd: AngularFireDatabase,
    public dialog: MatDialog
  ) { }

  ngOnInit() {
  }

  openReportDetailsDialog(details) {
    const reportDetailsDialog = this.dialog.open(ReportDetailsDialogComponent, {
      minWidth: '700px',
      minHeight: '600px',
      data: details
    });
  }

}
