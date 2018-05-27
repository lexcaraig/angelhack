import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ToolbarComponent } from './toolbar/toolbar.component';
import { MaterialModule } from '../material/material.module';
import { RouterModule } from '@angular/router';
import { CategoryComponent } from './category/category.component';
import { TableComponent } from './table/table.component';
import { StatusBarComponent } from './status-bar/status-bar.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule,

    MaterialModule
  ],
  declarations: [
    ToolbarComponent,
    CategoryComponent,
    TableComponent,
    StatusBarComponent
  ],
  exports: [
    ToolbarComponent,
    CategoryComponent,
    TableComponent,
    StatusBarComponent
  ]
})
export class ComponentsModule { }
