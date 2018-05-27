import { Component, OnInit, Input } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';
import { MatDialog } from '@angular/material';
import { Observable } from 'rxjs';
import { ReportDetailsDialogComponent } from '../report-details-dialog/report-details-dialog.component';

import { Reports } from '../../../shared/mocks/reports.mock';

@Component({
  selector: 'angelhack-report-list',
  templateUrl: './report-list.component.html',
  styleUrls: ['./report-list.component.scss']
})
export class ReportListComponent implements OnInit {
  columns = ['username', 'type', 'date', 'action'];
  report_list: Observable<any>;
  //reportsMock = Reports;

  constructor(
    private _afd: AngularFireDatabase,
    public dialog: MatDialog
  ) {
     _afd.object('report_list').valueChanges().subscribe(report_list => {
      console.log(report_list);
    });
   }
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
