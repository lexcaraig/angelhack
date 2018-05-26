import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccountComponent } from './account.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ReportListComponent } from './report-list/report-list.component';
import { ReportsComponent } from './reports/reports.component';
import { ReportDetailsComponent } from './report-details/report-details.component';

const routes: Routes = [
  {
    path: '',
    component: AccountComponent,
    children: [
      { path: '', pathMatch: 'full', redirectTo: 'dashboard' },
      { path: 'dashboard', component: DashboardComponent },
      {
        path: 'reports',
        component: ReportsComponent,
        children: [
          {
            path: ':name',
            component: ReportListComponent,
            children: [
              { path: ':id', component: ReportDetailsComponent }
            ]
          }
        ]
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AccountRoutingModule { }
