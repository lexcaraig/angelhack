import { Component, OnInit } from '@angular/core';
import { environment } from '../../../../environments/environment';

@Component({
  selector: 'angelhack-toolbar',
  templateUrl: './toolbar.component.html',
  styleUrls: ['./toolbar.component.scss']
})
export class ToolbarComponent implements OnInit {
  public appName: string = environment.appName;
  public description: string = environment.appDescription;

  constructor() { }

  ngOnInit() {
  }

}
