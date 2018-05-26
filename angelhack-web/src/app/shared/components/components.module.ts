import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ToolbarComponent } from './toolbar/toolbar.component';
import { MaterialModule } from '../material/material.module';
import { RouterModule } from '@angular/router';
import { CategoryComponent } from './category/category.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule,

    MaterialModule
  ],
  declarations: [ToolbarComponent, CategoryComponent],
  exports: [ToolbarComponent, CategoryComponent]
})
export class ComponentsModule { }
