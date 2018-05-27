import { Injectable } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';

import { map } from 'rxjs/operators';
import { Observable, BehaviorSubject } from 'rxjs';

@Injectable()
export class ReportsService {
  statusFilter$: BehaviorSubject<boolean> = new BehaviorSubject(false);
  reportRef;
  constructor(private _afd: AngularFireDatabase) {
    this._afd
      .object('reports')
      .valueChanges()
      .subscribe(reports => {
        this.reportRef = reports;
      });
  }

  getAllReportsByService(type: string): Observable<any[]> {
    return this._afd
      .object('reports')
      .valueChanges()
      .pipe(
        map(report => report[type.toLowerCase()]),
        map(report => {
          const keys = Object.keys(report);
          return keys.map(key => {
            report[key]['id'] = key;
            report[key]['type'] = type.toLowerCase();
            return report[key];
          });
        })
      );
  }

  update(report, type) {
    const reportsRef = this._afd.object('reports');
    this.reportRef[type] = {};
    this.reportRef[type][report.id] = report;
    reportsRef.update(this.reportRef);
    this.statusFilter$.next(<boolean>report.status);
  }
}
