import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';

import { ComponentsModule } from '../../shared/components/components.module';
import { AccountRoutingModule } from './account-routing.module';
import { AccountComponent } from './account.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { MaterialModule } from '../../shared/material/material.module';
import { ReportListComponent } from './report-list/report-list.component';
import { ReportsComponent } from './reports/reports.component';
import { FirebaseModule } from '../../shared/firebase/firebase.module';
import { ReportDetailsDialogComponent } from './report-details-dialog/report-details-dialog.component';
import { environment } from '../../../environments/environment';
import { ServicesModule } from '../../shared/services/services.module';

@NgModule({
  imports: [
    CommonModule,
    AccountRoutingModule,

    FirebaseModule,

    ComponentsModule,
    MaterialModule,
    ServicesModule
  ],
  declarations: [
    AccountComponent,
    DashboardComponent,
    ReportListComponent,
    ReportsComponent,
    ReportDetailsDialogComponent
  ],
  entryComponents: [ReportDetailsDialogComponent]
})
export class AccountModule {}
