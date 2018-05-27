import { Injectable } from '@angular/core';
import { AngularFireDatabase } from 'angularfire2/database';

import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Injectable()
export class ReportsService {

    constructor(private _afd: AngularFireDatabase) {}

    getAllReportsByService(type: string): Observable<any> {
       return this._afd.object('reports').valueChanges()
       .pipe(map(report => report[type]));
    }
}
