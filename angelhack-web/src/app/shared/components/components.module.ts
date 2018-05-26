import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ToolbarComponent } from './toolbar/toolbar.component';
import { MaterialModule } from '../material/material.module';
<<<<<<< HEAD
import { RouterModule } from '@angular/router';
=======
import { CategoryComponent } from './category/category.component';
>>>>>>> created category cards

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
