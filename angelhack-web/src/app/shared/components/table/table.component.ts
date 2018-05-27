import {
  Component,
  OnInit,
  Input,
  EventEmitter,
  Output,
  ViewChild,
  AfterViewInit
} from '@angular/core';
import { MatPaginator, MatTableDataSource, MatSort } from '@angular/material';
import { ReportsService } from '../../services/reports.service';
import * as _ from 'lodash';

@Component({
  selector: 'angelhack-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss']
})
export class TableComponent implements OnInit, AfterViewInit {
  @Input('columns') columns;
  @Input('source') source;

  public displayedColumns: Array<any>;
  public dataSource: MatTableDataSource<any[]>;
  public sourceT;

  @Output('onView') onView: EventEmitter<any> = new EventEmitter<any>();

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private reportService: ReportsService) {}

  ngOnInit() {
    this.displayedColumns = this.columns;
    this.sourceT = _.clone(this.source, true);
    this.dataSource = new MatTableDataSource<any[]>(this.source);
    this.getStatusFilter();
  }

  view(details) {
    this.onView.emit(details);
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  private getStatusFilter() {
    this.reportService.statusFilter$.subscribe(status => {
      this.source = _.filter(this.sourceT, { status: +status });
      this.dataSource = new MatTableDataSource<any[]>(this.source);
    });
  }
}
