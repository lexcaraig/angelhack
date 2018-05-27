import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { ReportsService } from '../../../shared/services/reports.service';

@Component({
  selector: 'angelhack-report-details-dialog',
  templateUrl: './report-details-dialog.component.html',
  styleUrls: ['./report-details-dialog.component.scss']
})
export class ReportDetailsDialogComponent implements OnInit {
  public details;
  constructor(
    public dialogRef: MatDialogRef<ReportDetailsDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private reportService: ReportsService
  ) {}

  ngOnInit() {
    this.details = this.data;
  }

  approveReport() {
    this.details.status = 1;
    this.reportService.update(this.details, this.details.type);
    this.dialogRef.close();
  }

  rejectReport() {
    this.details.status = 0;
    this.reportService.update(this.details, this.details.type);
    this.dialogRef.close();
  }
}
