import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ToolbarComponent } from './toolbar/toolbar.component';
import { MaterialModule } from '../material/material.module';
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [
    CommonModule,
    RouterModule,

    MaterialModule
  ],
  declarations: [ToolbarComponent],
  exports: [ToolbarComponent]
})
export class ComponentsModule { }
