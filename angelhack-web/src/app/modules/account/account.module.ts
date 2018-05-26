import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ComponentsModule } from '../../shared/components/components.module';
import { AccountRoutingModule } from './account-routing.module';
import { AccountComponent } from './account.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { MaterialModule } from '../../shared/material/material.module';
import { ReportListComponent } from './report-list/report-list.component';
import { ReportsComponent } from './reports/reports.component';
import { ReportDetailsComponent } from './report-details/report-details.component';
import { FirebaseModule } from '../../shared/firebase/firebase.module';

@NgModule({
  imports: [
    CommonModule,
    AccountRoutingModule,

    FirebaseModule,

    ComponentsModule,
    MaterialModule
  ],
  declarations: [
    AccountComponent,
    DashboardComponent,
    ReportListComponent,
    ReportsComponent,
    ReportDetailsComponent
  ]
})
export class AccountModule { }
