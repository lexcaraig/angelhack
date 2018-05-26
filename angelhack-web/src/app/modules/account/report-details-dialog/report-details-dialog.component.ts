import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';

@Component({
  selector: 'angelhack-report-details-dialog',
  templateUrl: './report-details-dialog.component.html',
  styleUrls: ['./report-details-dialog.component.scss']
})
export class ReportDetailsDialogComponent implements OnInit {
  public details;

  constructor(
    public dialogRef: MatDialogRef<ReportDetailsDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) { }

  ngOnInit() {
    this.details = this.data;
  }

}
