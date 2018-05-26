import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ToolbarComponent } from './toolbar/toolbar.component';
import { MaterialModule } from '../material/material.module';
import { RouterModule } from '@angular/router';
import { CategoryComponent } from './category/category.component';
import { TableComponent } from './table/table.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule,

    MaterialModule
  ],
  declarations: [
    ToolbarComponent,
    CategoryComponent,
    TableComponent
  ],
  exports: [
    ToolbarComponent,
    CategoryComponent,
    TableComponent
  ]
})
export class ComponentsModule { }
