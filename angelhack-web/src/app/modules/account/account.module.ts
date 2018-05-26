import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ComponentsModule } from '../../shared/components/components.module';
import { AccountRoutingModule } from './account-routing.module';
import { AccountComponent } from './account.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { MaterialModule } from '../../shared/material/material.module';

@NgModule({
  imports: [
    CommonModule,
    AccountRoutingModule,

    ComponentsModule,
    MaterialModule
  ],
  declarations: [
    AccountComponent,
    DashboardComponent
  ]
})
export class AccountModule { }
